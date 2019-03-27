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

    visit '/'
    fill_in 'q', with: 80206

    click_button 'Locate'

    expect(current_path).to eq('/search')

    expect(page).to have_content('Name: PUBLIC STATIONS')
    expect(page).to have_content('Address: 2951-2985 E 3rd Ave')
    expect(page).to have_content('Fuel Type: ELEC')
    expect(page).to have_content('Distance: 0.62888 miles')
    expect(page).to have_content('Access Times: 24 hours daily')
  end
end
