#As a user
#When I visit an Artist's Songs Index
#Then I see the titles of all the Artist's Songs
#And I see that each title is a link to the songs show page

require 'rails_helper'

RSpec.describe "officer arrests index page" do
  before do
    @officer_1 = Officer.create!(id: 1, name: "Zac Brown", badge_number: 23884, under_investigation: true)
    @arrest_1 = @officer_1.arrests.create!(id: 1, name: "Ralph Waldo Emerson", age: 23, charge_description: "Alcohol", firearm: true, created_at:"2022-07-06 02:05:39 UTC", updated_at:"2022-07-06 02:05:39 UTC", officer_id: 1)
    @arrest_2 = @officer_1.arrests.create!(id: 2, name: "Hamburglar", age: 25, charge_description: "Drug", firearm: false, created_at: "2022-07-06 02:05:39 UTC", updated_at:"2022-07-06 02:06:36 UTC", officer_id: 1)

    visit "/officers/#{@officer_1.id}/arrests"
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

  it 'shows all of the arrests for the officer' do
    expect(page).to have_content(@arrest_1.name)
    expect(page).to have_content(@arrest_2.name)
  end

  it "links to an arrests show page" do
    click_on(@arrest_1.name)
    expect(current_path).to eql("/arrests/#{@arrest_1.id}")
  end

  it 'links to a page to create a new arrest associated with this officer' do
    expect(page).to have_content("Create Arrest")
    click_link ("Create Arrest")
    expect(current_path).to eql("/officers/#{@officer_1.id}/arrests/new")
  end

  it 'links to an option to sort the arrests alphabetically' do
    expect(page).to have_content("Sort Arrests Alphabetically")
    click_link ("Sort Arrests Alphabetically")
    expect(current_path).to eql("/officers/#{@officer_1.id}/arrests")

    within "#arrest_table" do
      expect(page.all('.arrest_name')[0]).to have_content("Hamburglar")
      expect(page.all('.arrest_name')[1]).to have_content("Ralph Waldo Emerson")
    end
  
  end

end


# [x] done
# User Story 5, Parent Children Index 
# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes:

# [x] done
# User Story 16, Sort Parent's Children in Alphabetical Order by name 
# As a visitor
# When I visit the Parent's children Index Page
# Then I see a link to sort children in alphabetical order
# When I click on the link
# I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order