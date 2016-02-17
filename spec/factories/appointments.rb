FactoryGirl.define do
  factory :appointment do
    doctor
    patient
    appointment_date Date.today
  end
end
