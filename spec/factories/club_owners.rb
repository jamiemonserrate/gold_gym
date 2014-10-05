FactoryGirl.define do
  factory :club_owner do
    email 'factory@generated.com'
    association :club
  end
end