require 'rails_helper'

feature 'As a user I want to' do
  let(:page_object) { PageObjects::Commands.new }

  before do
    command = create(:command, :normal_mode)
    page_object.index.click_edit(command)
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
