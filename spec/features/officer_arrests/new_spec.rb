require 'rails_helper'

RSpec.describe 'it shows information on an officer based on id' do
  before do
    @officer_1 = Officer.create!(id: 1, name: "Zac Brown", badge_number: 23884, under_investigation: true)
    visit "/officers/#{@officer_1.id}/arrests/new"
  end

  it 'can create a new arrest' do
  fill_in('Name', with: "Marcus Aurelias")
  fill_in('Age', with: 40)
  fill_in('Charge description', with: 'Alcohol')
  check('firearm')
  click_button('Create Arrest')

  
  expect(current_path).to eql("/officers/#{@officer_1.id}/arrests")
  expect(page).to have_content("Marcus Aurelias")

  end

end



# [ ] done
# User Story 13, Parent Child Creation 
# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed