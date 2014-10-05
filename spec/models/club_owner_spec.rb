require 'rails_helper'

describe ClubOwner, :type => :model do
  it { should have_one(:club) }
  it { should accept_nested_attributes_for(:club) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:club) }

  context '#email' do
    it 'should be valid for valid emails' do
      expect(FactoryGirl.build(:club_owner, email: 'valid@email.com')).to be_valid
    end

    it 'should be invalid for invalid emails' do
      expect(FactoryGirl.build(:club_owner, email: 'invalidemail.com')).to_not be_valid
    end
  end
end
