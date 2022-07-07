require 'rails_helper'

RSpec.describe 'it shows all officers in system' do
  before do
    @officer_1 = Officer.create!(id: 1, name: "Zac Brown", badge_number: 23884, under_investigation: true)
    @officer_2 = Officer.create!(id: 2, name: "Mike Davis", badge_number: 22342, under_investigation: false)

    visit "/officers"
  end

  # within('header') do
  #   expect(page).to have_content('Officers')
  # end

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

  it 'displays officer names' do

    expect(page).to have_content("#{@officer_1.name}")
    expect(page).to have_content("#{@officer_2.name}")
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

end



# [x] done
# User Story 1, Parent Index 
# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system