require 'rails_helper'

feature 'As a user I want to' do
  before { create(:mode, name: 'Normal Mode') }

  scenario 'create a new command' do
    visit root_path

    within '.navbar' do
      click_on 'Commands'
      click_on 'New'
    end

    select("Normal Mode", from: "Mode")
    fill_in "Command", with: ":w"
    fill_in "Description", with: "Save file"

    click_on "Create"

    expect(page.current_path).to eq root_path
    expect(page).to have_content("A new command has been added")
  end

  scenario 'see an error when trying to create an invalid command' do
    visit root_path

    within '.navbar' do
      click_on 'Commands'
      click_on 'New'
    end

    click_on "Create"

    expect(page).to have_content(/can't be blank/)
  end
end
