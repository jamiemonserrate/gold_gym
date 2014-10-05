class Member < ActiveRecord::Base
  belongs_to :club

  belongs_to :workout
  accepts_nested_attributes_for :workout

  validates :last_name, :first_name, :club, presence: true

  def workout
    customized_workout = super

    return customized_workout if customized_workout
    club.workout if club
  end

  def full_name
    first_name + ' ' + last_name
  end
end
