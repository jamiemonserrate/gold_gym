require 'rails_helper'

describe Club, :type => :model do
  it { should have_one(:workout) }
  it { should have_many(:members) }
  it { should belong_to(:club_owner) }
  it { should accept_nested_attributes_for(:workout) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:workout) }
end
