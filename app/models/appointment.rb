class Appointment < ActiveRecord::Base
  belongs_to :patient
  belongs_to :doctor

  validates :patient, presence: true
  validates :doctor, presence: true
  validates :appointment_date, presence: true

  validate :check_doctors_available_hours
  validate :check_patient_money

  def check_doctors_available_hours
    if doctor.present? && !doctor.hours_available?
      errors.add(:doctor, 'Not enough available hours')
    end
  end

  def check_patient_money
    if patient.present? && doctor.present? && patient.money_amount < doctor.hourly_rate
      errors.add(:patient, 'Not enough money')
    end
  end
end
