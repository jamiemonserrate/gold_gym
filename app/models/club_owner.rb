class ClubOwner < ActiveRecord::Base
  has_one :club
  accepts_nested_attributes_for :club

  validates :email, presence: true, email: true
  validates :club, presence: true
end
