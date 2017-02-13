require 'rails_helper'

feature 'As user I want to' do
  context 'filter the commands by' do
    let!(:normal_commands) { create_list(:command, 3, :normal_mode) }
    let!(:visual_commands) { create_list(:command, 3, :visual_mode) }

    scenario 'normal mode' do
      visit root_path

      within '.nav' do
        click_on 'Commands'
        click_on 'All'
      end

      select 'Normal Mode', from: 'search_filter'
      click_on 'Filter'

      last_visual = visual_commands.last
      expect(page).to_not have_content last_visual.description
    end
  end
end
