require 'rails_helper'

RSpec.describe 'it shows information on an officer based on id' do
  before do
    @officer_1 = Officer.create!(id: 1, name: "Zac Brown", badge_number: 23884, under_investigation: true)
    @arrest_1 = Arrest.create!(id: 1, name: "Ralph Waldo Emerson", age: 23, charge_description: "Alcohol", firearm: true, created_at:"2022-07-06 02:05:39 UTC", updated_at:"2022-07-06 02:05:39 UTC", officer_id: 1)
    
    visit "/arrests/#{@arrest_1.id}/edit"
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

  it 'can update an arrest record' do
  fill_in('Name', with: "Ronald McDonald")
  fill_in('Age', with: 85)
  fill_in('Charge description', with: "Obesity Promotion")
  check('Firearm')

  click_button('Update Arrest')

  
  expect(current_path).to eql("/arrests/#{@arrest_1.id}")
  expect(page).to have_content("Ronald McDonald")
  expect(page).to have_content("85")
  expect(page).to have_content("Obesity Promotion")
  end
end

# [x] done
# User Story 14, Child Update 
# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information