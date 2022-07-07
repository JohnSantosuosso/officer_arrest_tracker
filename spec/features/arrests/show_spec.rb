require 'rails_helper'

RSpec.describe 'it shows information on a specific arrest' do
  before do
    @officer_1 = Officer.create!(id: 1, name: "Zac Brown", badge_number: 23884, under_investigation: true)
    @arrest_1 = Arrest.create!(id: 1, name: "Ralph Waldo Emerson", age: 23, charge_description: "Alcohol", firearm: true, created_at:"2022-07-06 02:05:39 UTC", updated_at:"2022-07-04 02:05:39 UTC", officer_id: 1)
    @arrest_2 = Arrest.create!(id: 2, name: "Steve Smith", age: 25, charge_description: "Drug", firearm: false, created_at: "2022-07-06 02:05:39 UTC", updated_at:"2022-07-06 02:06:36 UTC", officer_id: 1)

    visit "arrests/#{@arrest_1.id}"
  end

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

  it 'holds the arrestees attributes' do
    expect(page).to have_no_content("#{@arrest_2.name}")
    expect(page).to have_content("#{@arrest_1.age}")
    expect(page).to have_content("#{@arrest_1.charge_description}")
    expect(page).to have_content("#{@arrest_1.firearm}")
    expect(page).to have_content("#{@arrest_1.created_at}")
    expect(page).to have_content("#{@arrest_1.updated_at}")
  end

end

#[x] done
# User Story 4, Child Show 
# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes: