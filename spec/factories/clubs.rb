FactoryGirl.define do
  factory :club do
    name 'Gold Gym'
    address 'Pune'
    association :workout
  end
end