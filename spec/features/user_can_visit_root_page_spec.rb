require 'rails_helper'

feature "User can visit root page" do
  scenario "and view navbar contents" do
    visit "/"
    within(".navbar") do
      expect(page).to have_content("AltFuelFinder")
      expect(page).to have_selector("input[value='Search by zip...']")
    end
  end

  scenario 'and search for stations' do
    # As a user
    # When I visit "/"
    visit '/'
    fill_in 'q', with: 80206
    # And I fill in the search form with 80206 (Note: Use the existing search form)
    # And I click "Locate"
    click_button 'Locate'
    # Then I should be on page "/search"
    expect(current_path).to eq('/search')
    # Then I should see the total results of the stations that match my query.
    # Then I should see a list of the 15 closest stations within 5 miles sorted by distance
    # And the stations should be limited to Electric and Propane
    # And the stations should only be public, and not private, planned or temporarily unavailable.
    # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times

    # https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?limit=15&api_key=PbA3aOUG99pMY2qNifnyF9PIgXMQo6uKuNIXbK0v&location=80206&fuel_type=ELEC,LPG&access=public
    expect(page).to have_content('Name: PUBLIC STATIONS')
    expect(page).to have_content('Address: 2951-2985 E 3rd Ave')
    expect(page).to have_content('Fuel Type: Electric')
    expect(page).to have_content('Distance: 0.62888 miles')
    expect(page).to have_content('Access Times: 24 hours daily')
  end
end
