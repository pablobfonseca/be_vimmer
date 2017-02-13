ENV['RAILS_ENV'] ||= 'test'

if ENV['COVERAGE'] == 'on'
  require 'simplecov'
  SimpleCov.start 'rails' do
    minimum_coverage 100
    add_filter 'channels/application_cable/channel.rb'
    add_filter 'channels/application_cable/connection.rb'
    add_filter 'controllers/application_controller.rb'
    add_filter 'helpers/application_helper.rb'
    add_filter 'jobs/application_job.rb'
    add_filter 'mailers/application_mailer.rb'
    add_filter 'models/application_record.rb'
  end
end

require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/rails'
require 'capybara/poltergeist'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  config.include Capybara::DSL
  Capybara.javascript_driver = :poltergeist
end
