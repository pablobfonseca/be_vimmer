class DashboardController < ApplicationController
  def index
    @command_of_the_day ||= Command.randomize.first
  end
end
