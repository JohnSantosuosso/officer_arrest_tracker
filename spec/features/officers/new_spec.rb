require 'rails_helper'

RSpec.describe 'it shows information on an officer based on id' do
  before do
    visit "/officers/new"
  end

  it 'can create a new artist' do
  fill_in('Name', with: "John Smith")
  fill_in('Badge number', with: 34933)
  check('Under investigation')
  click_button('Create Officer')

  
  expect(current_path).to eql("/officers")
  expect(page).to have_content("John Smith")

  end

end

# [ ] done
# User Story 11, Parent Creation 
# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record

# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.