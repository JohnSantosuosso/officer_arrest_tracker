require 'rails_helper'

RSpec.describe 'it shows information on an officer based on id' do
  before do
    @officer_2 = Officer.create!(id: 2, name: "Mike Davis", badge_number: 22342, under_investigation: false, created_at: "2022-07-02 04:08:24 UTC", updated_at: "2022-07-03 04:08:24 UTC")

    visit "/officers/#{@officer_2.id}"
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

  
end