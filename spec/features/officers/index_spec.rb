require 'rails_helper'

RSpec.describe 'it shows all officers in system' do
  before do
    @officer_1 = Officer.create!(id: 1, name: "Zac Brown", badge_number: 23884, under_investigation: true, created_at: "2022-07-04 04:08:24 UTC", updated_at: "2022-07-05 04:08:24 UTC")
    @officer_2 = Officer.create!(id: 2, name: "Mike Davis", badge_number: 22342, under_investigation: false, created_at: "2022-07-02 04:08:24 UTC", updated_at: "2022-07-03 04:08:24 UTC")

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

  it 'displays officer names sorted by most recently created' do

    expect(page).to have_content("#{@officer_1.name}")
    expect(page).to have_content("#{@officer_1.created_at}")
    expect(page).to have_content("#{@officer_2.name}")
    expect(page).to have_content("#{@officer_2.created_at}")
  end

  xit 'displays officers in order by most recently created' do

    expect(page).to have_content("#{@officer_1.name}")
    expect(page).to have_content("#{@officer_1.created_at}")
    expect(page).to have_content("#{@officer_1.updated_at}")
    expect(page).to have_content("#{@officer_2.name}")
    expect(page).to have_content("#{@officer_2.created_at}")
    expect(page).to have_content("#{@officer_2.updated_at}")
  end

  it 'clicks on officer name to open the officers page' do
    click_link ("#{@officer_1.name}")
    expect(current_path).to eql("/officers/#{@officer_1.id}")

    visit "/officers"

    click_link ("#{@officer_2.name}")
    expect(current_path).to eql("/officers/#{@officer_2.id}")
  end

  it 'clicks Update Officer link to update an officer by ID' do
    click_link ("Update #{@officer_1.name}")
    expect(current_path).to eql("/officers/#{@officer_1.id}/edit")

    visit "/officers"

    click_link ("Update #{@officer_2.name}")
    expect(current_path).to eql("/officers/#{@officer_2.id}/edit")
  end

  it 'has a New Officer link that opens a page to create a new officer' do
    click_link ("New Officer")
    expect(current_path).to eql("/officers/new")
  end

  it 'has a delete link next to each officer that deletes that officer and returns to the index page' do
    expect(page).to have_content("#{@officer_1.name}")
    expect(page).to have_selector(:link_or_button, "Delete Officer #{@officer_1.name}")
    click_on ("Delete Officer #{@officer_1.name}")
    expect(current_path).to eql("/officers")
    expect(page).to have_no_content("#{@officer_1.name}")
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