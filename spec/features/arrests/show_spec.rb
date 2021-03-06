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

  it 'has a link to a page to update the current Arrest record' do
  expect(page).to have_content("#{@arrest_1.name}")
   expect(page).to have_selector(:link_or_button, "Edit #{@arrest_1.name}")

    click_button ("Edit #{@arrest_1.name}")

    expect(current_path).to eql("/arrests/#{@arrest_1.id}/edit")
  end

  it 'deletes the current arrest' do
    @officer_3 = Officer.create!(id: 3, name: "Sean Connery", badge_number: 21324, under_investigation: true, created_at: "2022-04-06 04:08:24 UTC", updated_at: "2022-05-07 04:08:24 UTC")
    @arrest_3 = Arrest.create!(id: 3, name: "The Hamburglar", age: 54, charge_description: "Theft", firearm: false, created_at: "2022-07-04 02:05:39 UTC", updated_at:"2022-07-04 02:06:36 UTC", officer_id: 3)
    
    visit "/arrests/#{@arrest_3.id}"
    
    expect(page).to have_content("#{@arrest_3.name}")
    expect(page).to have_selector(:link_or_button, "Delete #{@arrest_3.name}")

    click_on ("Delete #{@arrest_3.name}")

    expect(current_path).to eql("/arrests")
    expect(page).to have_no_content(@arrest_3.name)
  end

end

#[x] done
# User Story 4, Child Show 
# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes:

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



# [x] done
# User Story 20, Child Delete 
# As a visitor
# When I visit a child show page
# Then I see a link to delete the child "Delete Child"
# When I click the link
# Then a 'DELETE' request is sent to '/child_table_name/:id',
# the child is deleted,
# and I am redirected to the child index page where I no longer see this child