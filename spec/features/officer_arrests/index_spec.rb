#As a user
#When I visit an Artist's Songs Index
#Then I see the titles of all the Artist's Songs
#And I see that each title is a link to the songs show page

require 'rails_helper'

RSpec.describe "officer arrests index page" do
  before do
    @officer_1 = Officer.create!(id: 1, name: "Zac Brown", badge_number: 23884, under_investigation: true)
    @arrest_1 = @officer_1.arrests.create!(id: 1, name: "Ralph Waldo Emerson", age: 23, charge_description: "Alcohol", firearm: true, created_at:"2022-07-06 02:05:39 UTC", updated_at:"2022-07-06 02:05:39 UTC", officer_id: 1)
    @arrest_2 = @officer_1.arrests.create!(id: 2, name: "Steve Smith", age: 25, charge_description: "Drug", firearm: false, created_at: "2022-07-06 02:05:39 UTC", updated_at:"2022-07-06 02:06:36 UTC", officer_id: 1)

    visit "/officers/#{@officer_1.id}/arrests"
  end

  it 'shows all of the arrests for the officer' do

    expect(page).to have_content(@arrest_1.name)
    expect(page).to have_content(@arrest_2.name)
  end

  it "links to each songs show page" do

    click_on(@arrest_1.name) #click on is capybara method
    expect(current_path).to eql("/arrests/#{@arrest_1.id}") #current path is capybara method
  end

  xit "shows the average song length for the artist" do
    prince = Artist.create!(name: 'Prince')
    purple = prince.songs.create!(title: 'Purple Rain', length: 834, play_count: 8934)
    beret = prince.songs.create!(title: 'Raspberry Beret', length: 934, play_count: 930)

    visit "/artists/#{prince.id}/songs"

    expect(page).to have_content("Average Song Length for Prince: 884")

  end


end


# [x] done
# User Story 5, Parent Children Index 
# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes: