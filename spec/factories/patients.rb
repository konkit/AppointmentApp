FactoryGirl.define do
  factory :patient do
    name FFaker::Name.name
    money_amount 30.0
  end
end
