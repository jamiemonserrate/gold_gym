require 'rails_helper'

describe 'ClubOwners', :type => :feature do
  it 'should be able to create a club owner' do
    visit root_path

    click_link('Create a new Club Owner')
    fill_in('Email', :with => 'club@owner.com')
    fill_in('Name of the Club', :with => 'Gold Gym')
    fill_in('Address of the Club', :with => 'Pune')
    fill_in('Default Workout of the club', :with => 'Abs Workout')
    click_button('Create Club owner')

    expect(page).to have_content('Club owner was successfully created.')
  end

  it 'should be able to manage members of the club' do
    club = FactoryGirl.create(:club_owner).club
    FactoryGirl.create(:member, first_name: 'jamie', last_name: 'monserrate', club: club)

    visit(club_path(club))

    expect(page).to have_content('Member no. 0: jamie monserrate')

    click_link('Remove from club')
    expect(page).to_not have_content('Member no. 0: jamie monserrate')
  end
end
