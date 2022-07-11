require 'rails_helper'

RSpec.describe 'it shows all officers in system' do
  before do
    @officer_1 = Officer.create!(id: 1, name: "Zac Brown", badge_number: 23884, under_investigation: true, created_at: "2022-07-04 04:08:24 UTC", updated_at: "2022-07-05 04:08:24 UTC")
    @officer_2 = Officer.create!(id: 2, name: "Mike Davis", badge_number: 22342, under_investigation: false, created_at: "2022-07-02 04:08:24 UTC", updated_at: "2022-07-03 04:08:24 UTC")
    @arrest_1 = @officer_1.arrests.create!(id: 1, name: "Ralph Waldo Emerson", age: 23, charge_description: "Alcohol", firearm: true, created_at:"2022-07-06 02:05:39 UTC", updated_at:"2022-07-06 02:05:39 UTC", officer_id: 1)
    @arrest_2 = @officer_1.arrests.create!(id: 2, name: "Hamburglar", age: 25, charge_description: "Drug", firearm: false, created_at: "2022-07-06 02:05:39 UTC", updated_at:"2022-07-06 02:06:36 UTC", officer_id: 1)
    
    visit "/officers"
  end

  # within('header') do
  #   expect(page).to have_content('Officers')
  # end

  #add test for order of officers sorted by added

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

  it 'displays officers on the page' do
    expect(page).to have_content("#{@officer_1.name}")
    expect(page).to have_content("#{@officer_1.created_at}")
    expect(page).to have_content("#{@officer_2.name}")
    expect(page).to have_content("#{@officer_2.created_at}")
  end

  it 'displays officers in order by most recently created' do
    within "#officer_table" do
      expect(page.all('.officer_name_link')[0]).to have_content("Zac Brown")
      expect(page.all('.officer_name_link')[1]).to have_content("Mike Davis")
    end
  end

  it 'clicks on officer name to open the officers page' do
    click_link ("#{@officer_1.name}")
    expect(current_path).to eql("/officers/#{@officer_1.id}")

    visit "/officers"

    click_link ("#{@officer_2.name}")
    expect(current_path).to eql("/officers/#{@officer_2.id}")
  end

  it 'clicks Update Officer link to update an officer by ID' do
    click_on ("Update #{@officer_1.name}")
    expect(current_path).to eql("/officers/#{@officer_1.id}/edit")

    visit "/officers"

    click_on ("Update #{@officer_2.name}")
    expect(current_path).to eql("/officers/#{@officer_2.id}/edit")
  end

  it 'has a New Officer link that opens a page to create a new officer' do
    click_on ("New Officer")
    expect(current_path).to eql("/officers/new")
  end

  it 'has a delete link next to each officer that deletes that officer and returns to the index page' do
    expect(page).to have_content("#{@officer_1.name}")
    expect(page).to have_selector(:link_or_button, "Delete #{@officer_1.name}")

    click_on ("Delete #{@officer_1.name}")

    expect(current_path).to eql("/officers")
    expect(page).to have_no_content("#{@officer_1.name}")
  end

  xit 'has a button, that when clicked, sorts officers by number of arrests from highest to lowest' do
    @officer_3 = Officer.create!(id: 3, name: "Inspector Gadget", badge_number: 23233, under_investigation: false, created_at: "2022-07-02 04:08:24 UTC", updated_at: "2022-07-03 04:08:24 UTC")
    @arrest_3 = @officer_3.arrests.create!(id: 3, name: "Joker", age: 20, charge_description: "Theft", firearm: true, created_at:"2022-07-06 02:05:39 UTC", updated_at:"2022-07-06 02:05:39 UTC", officer_id: 3)
    
    within "#sort_by_arrests" do
    expect(page).to have_selector(:link_or_button, "Sort Officers By Arrests(High to Low)")
    end

    click_on ("Sort Officers By Arrests(High to Low)")
    
    expect(current_path).to eql("/officers")
    
    within "#officer_table" do
      expect(page.all('.officer_name_link')[0]).to have_content("Zac Brown")
      expect(page.all('.officer_name_link')[1]).to have_content("Inspector Gadget")
      expect(page.all('.officer_name_link')[2]).to have_content("Mike Davis")
    end
  end

end



# [x] done
# User Story 1, Parent Index 
# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

# [x] done
# User Story 6, Parent Index sorted by Most Recently Created 
# As a visitor
# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created

# [x] done
# User Story 17, Parent Update From Parent Index Page 
# As a visitor
# When I visit the parent index page
# Next to every parent, I see a link to edit that parent's info
# When I click the link
# I should be taken to that parents edit page where I can update its information just like in User Story 4