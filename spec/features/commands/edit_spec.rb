require 'rails_helper'

feature 'As a user I want to' do
  before do
    command = create(:command, :normal_mode)

    visit root_path

    within '.nav' do
      click_on 'Commands Per Mode'
      click_on 'Normal Mode'
    end

    click_on "edit_command_#{command.id}"
  end

  scenario 'edit command' do
    fill_in 'Command', with: 'a'
    fill_in 'Description', with: 'Append cursor to the end of the character'

    click_on 'Update Command'

    expect(page).to have_content 'The command has been updated'
  end

  scenario 'see an error when trying to update an invalid command' do
    fill_in 'Command', with: ''
    fill_in 'Description', with: ''

    click_on 'Update Command'

    expect(page).to have_content(/can't be blank/)
  end
end
