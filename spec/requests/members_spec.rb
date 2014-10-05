require 'rails_helper'

describe 'Members', :type => :feature do
  it 'should be able to create a member with custom workout' do
    FactoryGirl.create(:club, name: 'air gym')

    visit root_path

    click_link('Create a new Member')

    fill_in('Last name', :with => 'Monserrate')
    fill_in('First name', :with => 'Jamie')
    select 'air gym', :from => 'Which club to enroll in?'

    fill_in('Your custom workout (Leave this empty will default to the club workout)', :with => 'My custom workout')

    click_button('Create Member')
    expect(page).to have_content('Member was successfully created.')
  end

  it 'should be able to default back to club workout' do
    club = FactoryGirl.create(:club, workout: Workout.create(title: 'Abs Workout'))
    member = FactoryGirl.create(:member, workout: Workout.create(title: 'My custom workout'), club: club)

    visit member_path(member)

    expect(page).to have_content('Workout: My custom workout')

    click_link('Edit')
    fill_in('Your custom workout (Leave this empty will default to the club workout)', :with => '')
    click_button('Update Member')

    expect(page).to have_content('Member was successfully updated.')
    expect(page).to have_content('Workout: Abs Workout')
  end
end
