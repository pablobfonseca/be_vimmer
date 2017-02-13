require 'rails_helper'

feature 'As User I Want to' do
  let!(:commands) { create_list(:command, 3, :normal_mode) }
  let(:last_command) { Command.last }

  scenario 'see a list of commands' do
    visit root_path
    within '.nav' do
      click_on "Commands"
      click_on "All"
    end

    expect(page).to have_content(last_command.description)
  end
end
