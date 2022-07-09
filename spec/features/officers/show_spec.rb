require 'rails_helper'

RSpec.describe 'it shows information on an officer based on id' do
  before do
    @officer_1 = Officer.create!(id: 1, name: "Zac Brown", badge_number: 23884, under_investigation: true, created_at: "2022-07-04 04:08:24 UTC", updated_at: "2022-07-06 04:08:24 UTC")
    @officer_2 = Officer.create!(id: 2, name: "Mike Davis", badge_number: 22342, under_investigation: false, created_at: "2022-07-06 04:08:24 UTC", updated_at: "2022-07-07 04:08:24 UTC")

    visit "/officers/#{@officer_1.id}"
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

  it 'holds the officers information' do
    expect(page).to have_no_content("#{@officer_2.name}")
    expect(page).to have_content("#{@officer_1.name}")
    expect(page).to have_content("#{@officer_1.badge_number}")
    expect(page).to have_content("Yes")
    expect(page).to have_content("#{@officer_1.created_at}")
    expect(page).to have_content("#{@officer_1.updated_at}")
    #Total arrests is not included because it is tested in the model

    
    click_link ("#{@officer_1.name} Arrests")

    expect(current_path).to eql("/officers/#{@officer_1.id}/arrests")
  end

  it 'links to a page to update the current officer' do
    expect(page).to have_content("Update Officer")
    click_link ('Update Officer')
    expect(current_path).to eql("/officers/#{@officer_1.id}/edit")
  end

  it 'deletes the current officer' do
    @officer_3 = Officer.create!(id: 3, name: "Sean Connery", badge_number: 21324, under_investigation: true, created_at: "2022-04-06 04:08:24 UTC", updated_at: "2022-05-07 04:08:24 UTC")
    visit "/officers/#{@officer_3.id}"
    page.should have_selector("input[type=submit][value='Delete Officer']")
    click_button ('Delete Officer')
    expect(current_path).to eql("/officers")
    expect(page).to have_no_content(@officer_3.name)
  end

end


# [x] done
# User Story 2, Parent Show 
# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes:
# - data from each column that is on the parent table

# [x] done
# User Story 10, Parent Child Index Link
# As a visitor
# When I visit a parent show page ('/parents/:id')
# Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')

# [x] done
# User Story 12, Parent Update 
# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"

# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info

# [x] done
# User Story 19, Parent Delete 
# As a visitor
# When I visit a parent show page
# Then I see a link to delete the parent
# When I click the link "Delete Parent"
# Then a 'DELETE' request is sent to '/parents/:id',
# the parent is deleted, and all child records are deleted
# and I am redirected to the parent index page where I no longer see this parent