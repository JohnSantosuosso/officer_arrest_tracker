require 'rails_helper'

# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

RSpec.describe 'it shows all officers in system' do
  before do
    officer_1 = Officer.create!(id: 1, name: "Zac Brown", badge_number: 23884, under_investigation: true)
    officer_2 = Officer.create!(id: 2, name: "Mike Davis", badge_number: 22342, under_investigation: false)

    visit "/officers"
  end
  it 'displays officer names' do

    expect(page).to have_content("Zac Brown")
    expect(page).to have_content("Mike Davis")
  end

  it 'clicks on officer name to open to the officer page' do
    #save_and_open_page # from capybara to view whole page

    click_link ('Zac Brown')

    expect(current_path).to eql("/officers/1")

    visit "/officers"

    click_link ('Mike Davis')

    expect(current_path).to eql("/officers/2")
  end

end