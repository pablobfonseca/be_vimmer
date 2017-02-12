require 'rails_helper'

feature 'As User I Want to' do
  context 'see a list of commands of' do
    scenario 'normal mode' do
      command = create(:command, :normal_mode)

      visit root_path
      within '.nav' do
        click_on "Commands Per Mode"
        click_on "Normal Mode"
      end

      expect(page).to have_content(command.description)
    end

    scenario 'visual mode' do
      command = create(:command, :visual_mode)

      visit root_path
      within '.nav' do
        click_on "Commands Per Mode"
        click_on "Visual Mode"
      end

      expect(page).to have_content(command.description)
    end
  end

  scenario 'see a message when does not have any command' do
    visit normal_mode_commands_path

    expect(page).to have_content 'There are no commands yet'
  end
end
