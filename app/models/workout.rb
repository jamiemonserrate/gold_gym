class Workout < ActiveRecord::Base
  validates :title, presence: true
end
