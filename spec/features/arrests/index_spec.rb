require 'rails_helper'


RSpec.describe 'it shows all officers in system' do
  before do
    officer_1 = Officer.create!(id: 1, name: "Zac Brown", badge_number: 23884, under_investigation: true)
    arrest_1 = Arrest.create!(id: 1, name: "Ralph Waldo Emerson", age: 23, charge_description: "Alcohol", firearm: true, created_at:"2022-07-06 02:05:39 UTC", updated_at:"2022-07-06 02:05:39 UTC", officer_id: 1)
    arrest_2 = Arrest.create!(id: 2, name: "Steve Smith", age: 25, charge_description: "Drug", firearm: false, created_at: "2022-07-06 02:05:39 UTC", updated_at:"2022-07-06 02:06:36 UTC", officer_id: 1)

    visit "/arrests"
  end

  # within('header') do
  #   expect(page).to have_content('Officers')
  # end

  it 'links to the arrests index at the top of every page' do

    expect(page).to have_content("Arrests")

    click_link ('Arrests')
    expect(current_path).to eql("/arrests")
  end

  it 'links to the officers index at the top of every page' do

    expect(page).to have_content("Officers")

    click_link ('Officers')
    expect(current_path).to eql("/officers")
  end

  it 'displays arrested individuals attributes if they had a firearm on them' do
    expect(page).to have_content("Ralph Waldo Emerson")
    expect(page).to have_content("23")
    expect(page).to have_content("true")
    expect(page).to have_content("2022-07-06 02:05:39 UTC")
    expect(page).to have_content("2022-07-06 02:05:39 UTC")
  end

  xit 'opens a page containing a record on the arrested individual when link is opened' do

  end

  xit 'does not display arrested individuals attributes if they did not have a firearm on them' do

  end

end


# [x] done
# User Story 3, Child Index 
# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes: