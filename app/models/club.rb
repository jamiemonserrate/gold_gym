class Club < ActiveRecord::Base
  has_one :workout
  accepts_nested_attributes_for :workout

  belongs_to :club_owner

  has_many :members

  validates :name, :workout, presence: true
end
