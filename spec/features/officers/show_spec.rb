require 'rails_helper'

RSpec.describe 'it shows information on an officer based on id' do
  before do
    officer_1 = Officer.create!(id: 1, name: "Zac Brown", badge_number: 23884, under_investigation: true, created_at: "2022-07-04 04:08:24 UTC", updated_at: "2022-07-06 04:08:24 UTC")
    officer_2 = Officer.create!(id: 2, name: "Mike Davis", badge_number: 22342, under_investigation: false)

    visit "/officers/1"
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
    expect(page).to have_no_content("Mike Davis")
    expect(page).to have_content("Zac Brown")
    expect(page).to have_content("23884")
    expect(page).to have_content("Yes")
    expect(page).to have_content("2022-07-06 04:08:24 UTC")
    expect(page).to have_content("2022-07-04 04:08:24 UTC")
    #Total arrests is not included because it is tested in the model

    
    click_link ('View')

    expect(current_path).to eql("/officers/1/arrests")
  end

end


# [x] done
# User Story 2, Parent Show 
# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes:
# - data from each column that is on the parent table