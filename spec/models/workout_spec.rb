require 'rails_helper'

describe Workout, :type => :model do
  it { should validate_presence_of(:title) }
end
