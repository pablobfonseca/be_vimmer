require 'rails_helper'

feature 'As an user I want to' do
  scenario 'access the home page' do
    visit root_path

    expect(page).to have_content("Welcome to Be Vimmer")
  end
end
