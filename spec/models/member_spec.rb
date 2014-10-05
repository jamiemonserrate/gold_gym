require 'rails_helper'

describe Member, :type => :model do
  it { should belong_to(:club) }
  it { should belong_to(:workout) }
  it { should accept_nested_attributes_for(:workout) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:club) }

  context '#workout' do
    it 'should return the workout if present' do
      custom_workout = Workout.new(title: 'Back Workout')
      member = Member.new(workout: custom_workout)

      expect(member.workout).to eq(custom_workout)
    end

    it 'should return the clubs workout if none present' do
      club_workout = Workout.new(title: 'Club Workout')
      member = Member.new(workout: nil, club: Club.new(workout: club_workout))

      expect(member.workout).to eq(club_workout)
    end

    it 'should return nil if no woorkout available' do
      member = Member.new(workout: nil, club: nil)

      expect(member.workout).to eq(nil)
    end
  end
end
