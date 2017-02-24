module PageObjects
  class Commands
    include Capybara::DSL
    include Rails.application.routes.url_helpers

    def index
      visit root_path

      within '.nav' do
        click_on 'Commands'
        click_on 'All'
      end
      self
    end

    def click_edit(command)
      click_on "edit_command_#{command.id}"
    end

    def click_new
      visit root_path

      within '.navbar' do
        click_on 'Commands'
        click_on 'New'
      end
      self
    end
  end
end
