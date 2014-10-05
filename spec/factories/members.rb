FactoryGirl.define do
  factory :member do
    last_name 'Monserrate'
    first_name 'jamie'
    association :club
    association :workout
  end
end