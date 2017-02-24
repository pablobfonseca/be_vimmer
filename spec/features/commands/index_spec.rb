require 'rails_helper'

feature 'As User I Want to' do
  scenario 'see a list of commands' do
    page_object = PageObjects::Commands.new
    commands     = create_list(:command, 3, :normal_mode)
    last_command = Command.last

    page_object.index

    expect(page).to have_content(last_command.description)
  end
end
