require 'rails_helper'

RSpec.describe Doctor, type: :model do
  it { is_expected.to validate_presence_of :name }

  it { is_expected.to validate_presence_of :hourly_rate }
  it { is_expected.to validate_numericality_of :hourly_rate }

  it { is_expected.to validate_presence_of :hours_per_week }
  it { is_expected.to validate_numericality_of :hours_per_week }

  describe 'hours_available?' do
    context 'when there are more hours_per_week than appointments' do
      let(:doctor) { FactoryGirl.create(:doctor, hours_per_week: 2) }
      let!(:doctor_appointment) { FactoryGirl.create(:appointment, doctor: doctor) }

      it 'should return true' do
        expect(doctor.hours_available?).to eq(true)
      end
    end

    context 'when there are less or equal hours_per_week than appointments' do
      let(:doctor) { FactoryGirl.create(:doctor, hours_per_week: 1) }
      let!(:doctor_appointment) { FactoryGirl.create(:appointment, doctor: doctor) }

      it 'should return false' do
        expect(doctor.hours_available?).to eq(false)
      end
    end
  end
end
