require 'rails_helper'


RSpec.describe 'it shows all officers in system' do
  before do
    @officer_1 = Officer.create!(id: 1, name: "Zac Brown", badge_number: 23884, under_investigation: true)
    @arrest_1 = Arrest.create!(id: 1, name: "Ralph Waldo Emerson", age: 23, charge_description: "Alcohol", firearm: true, created_at:"2022-07-06 02:05:39 UTC", updated_at:"2022-07-06 02:05:39 UTC", officer_id: 1)
    @arrest_2 = Arrest.create!(id: 2, name: "Steve Smith", age: 25, charge_description: "Drug", firearm: true, created_at: "2022-07-06 02:05:39 UTC", updated_at:"2022-07-06 02:06:36 UTC", officer_id: 1)
    @arrest_3 = Arrest.create!(id: 3, name: "The Hamburglar", age: 54, charge_description: "Theft", firearm: false, created_at: "2022-07-04 02:05:39 UTC", updated_at:"2022-07-04 02:06:36 UTC", officer_id: 1)

    visit "/arrests"
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

  it 'displays arrested individuals attributes only if they had a firearm on them' do
    expect(page).to have_content("#{@arrest_1.name}")
    expect(page).to have_content("#{@arrest_1.age}")
    expect(page).to have_content("#{@arrest_1.firearm}")
    expect(page).to have_content("#{@arrest_1.created_at}")
    expect(page).to have_content("#{@arrest_1.updated_at}")

    expect(page).to have_content("#{@arrest_2.name}")
    expect(page).to have_content("#{@arrest_2.age}")
    expect(page).to have_content("#{@arrest_2.firearm}")
    expect(page).to have_content("#{@arrest_2.created_at}")
    expect(page).to have_content("#{@arrest_2.updated_at}")

    expect(page).to have_no_content("#{@arrest_3.name}")
    expect(page).to have_no_content("#{@arrest_3.age}")
    expect(page).to have_no_content("#{@arrest_3.firearm}")
    expect(page).to have_no_content("#{@arrest_3.created_at}")
    expect(page).to have_no_content("#{@arrest_3.updated_at}")
  end

  it 'clicks on arrestees name to open additional details on the arrestee page' do
    click_link ("View #{@arrest_1.name}")
    expect(current_path).to eql("/arrests/#{@arrest_1.id}")

    visit "/arrests"

    click_link ("View #{@arrest_2.name}")
    expect(current_path).to eql("/arrests/#{@arrest_2.id}")
  end

  it 'clicks on edit name to open additional details on the arrestee page' do
    click_link ("Edit #{@arrest_1.name}")
    expect(current_path).to eql("/arrests/#{@arrest_1.id}/edit")

    visit "/arrests"

    click_link ("Edit #{@arrest_2.name}")
    expect(current_path).to eql("/arrests/#{@arrest_2.id}/edit")
  end
end


# [x] done
# User Story 3, Child Index 
# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes:

# [x] done
# User Story 4, Child Show 
# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes:

# [x] done
# User Story 15, Child Index only shows `true` Records 
# As a visitor
# When I visit the child index
# Then I only see records where the boolean column is `true`