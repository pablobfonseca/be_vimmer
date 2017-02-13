require 'rails_helper'

feature 'As a user I want to' do
  before do
    visit root_path

    within '.navbar' do
      click_on 'Commands'
      click_on 'New'
    end
  end

  scenario 'create a new command' do
    select('Normal Mode', from: 'Vim Mode')
    fill_in 'Command', with: ':w'
    fill_in 'Description', with: 'Save file'

    click_on 'Create Command'

    expect(page.current_path).to eq root_path
    expect(page).to have_content('A new command has been added')
  end

  scenario 'see an error when trying to create an invalid command' do
    click_on 'Create'

    expect(page).to have_content(/can't be blank/)
  end

  context 'duplicated command' do
    scenario 'I can not create a duplicated command' do
      command1 = create(:command, :visual_mode)

      select 'Visual Mode', from: 'Vim Mode'
      fill_in 'Command', with: command1.command
      fill_in 'Description', with: command1.description
      click_on 'Create Command'

      expect(page).to have_content(/already been taken/)
    end
  end
end
