require 'rails_helper'

feature 'As a user I want to' do
  scenario 'see the command of the day' do
    command = create(:command, :normal_mode)
    visit root_path

    expect(page).to have_content("Command of the day")
    expect(page).to have_content(command.command)
    expect(page).to have_content(command.description)
  end
end
