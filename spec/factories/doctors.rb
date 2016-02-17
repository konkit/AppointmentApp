FactoryGirl.define do
  factory :doctor do
    name FFaker::Name.name
    hourly_rate 25.0
    hours_per_week 3
  end
end
