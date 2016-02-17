require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it 'should have a valid factory' do
    expect(FactoryGirl.build(:appointment)).to be_valid
  end

  it { is_expected.to validate_presence_of :doctor }

  it { is_expected.to validate_presence_of :patient }

  it { is_expected.to validate_presence_of :appointment_date }

  describe 'create' do
    let(:patient) { FactoryGirl.create(:patient) }
    let(:doctor)  { FactoryGirl.create(:doctor)  }

    subject { Appointment.create(doctor: doctor, patient: patient, appointment_date: Date.today) }

    it 'should create appointment in normal conditions' do
      expect(subject).to be_valid
    end

    context 'when patient has not enough money' do
      let(:poor_patient) { FactoryGirl.create(:patient, money_amount: 10.0) }

      it 'should return invalid Appointment object' do
        appointment = Appointment.create(doctor: doctor, patient: poor_patient, appointment_date: Date.today)
        expect(appointment).not_to be_valid
      end
    end

    context 'when doctor doesnt have available hours' do
      let(:busy_doctor) { FactoryGirl.create(:doctor, hours_per_week: 1) }
      let(:busys_doctor_appointment) { FactoryGirl.create(:appointment, doctor: busy_doctor) }

      it 'should return invalid Appointment object' do
        appointment = Appointment.create(doctor: busy_doctor, patient: patient, appointment_date: Date.today)
        expect(appointment).not_to be_valid
      end
    end
  end
end
