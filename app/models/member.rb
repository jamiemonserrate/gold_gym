class Member < ActiveRecord::Base
  belongs_to :club

  belongs_to :workout
  accepts_nested_attributes_for :workout

  validates :last_name, :first_name, :club, presence: true

  def workout
    super || club.try(:workout)
  end

  def full_name
    first_name + ' ' + last_name
  end
end
