require 'rails_helper'

RSpec.describe 'it shows information on an officer based on id' do
  before do
    @officer_2 = Officer.create!(id: 2, name: "Mike Davis", badge_number: 22342, under_investigation: false, created_at: "2022-07-02 04:08:24 UTC", updated_at: "2022-07-03 04:08:24 UTC")

    visit "/officers/#{@officer_2.id}/edit"
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

  it 'can update an officers record' do
  save_and_open_page
  fill_in('Name', with: "Frank Castle")
  fill_in('Badge number', with: 23233)
  check('Under investigation')
  click_button('Update Officer')

  
  expect(current_path).to eql("/officers/#{@officer_2.id}")
  expect(page).to have_content("Frank Castle")

  end


end


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