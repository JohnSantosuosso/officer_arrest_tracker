require 'rails_helper'

RSpec.describe 'it has a welcome page that opens the parent index page' do
  before do
   visit '/'
  end

  it 'opens the officers index page when the Enter Site button is clicked' do
    #save_and_open_page
    expect(page).to have_content('Enter Site')

    click_link('Enter Site')

    expect(current_path).to eql("/officers")
  end

end