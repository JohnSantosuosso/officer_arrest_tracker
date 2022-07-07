require 'rails_helper'

RSpec.describe 'it shows information on an officer based on id' do
  before do
    officer_1 = Officer.create!(id: 1, name: "Zac Brown", badge_number: 23884, under_investigation: true)
    arrest_1 = Arrest.create!(id: 1, name: "Ralph Waldo Emerson", age: 23, charge_description: "Alcohol", firearm: true, created_at:"2022-07-06 02:05:39 UTC", updated_at:"2022-07-04 02:05:39 UTC", officer_id: 1)
    arrest_2 = Arrest.create!(id: 2, name: "Steve Smith", age: 25, charge_description: "Drug", firearm: false, created_at: "2022-07-06 02:05:39 UTC", updated_at:"2022-07-06 02:06:36 UTC", officer_id: 1)

    visit 'arrests/1'
  end

  it 'holds the arrestees attributes' do
    expect(page).to have_no_content("Steve Smith")
    expect(page).to have_content("Ralph Waldo Emerson")
    expect(page).to have_content("23")
    expect(page).to have_content("Alcohol")
    expect(page).to have_content("2022-07-06 02:05:39 UTC")
    expect(page).to have_content("2022-07-04 02:05:39 UTC")
    #Total arrests is not included because it is tested in the model


  end

end

#[x] done
# User Story 4, Child Show 
# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes: