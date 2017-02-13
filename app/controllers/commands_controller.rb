class CommandsController < ApplicationController
  before_action :load_vim_modes

  def index
    @commands = Command.filter(params.dig(:search, :filter))
  end

  def new
    @command = Command.new
  end

  def edit
    command
  end

  def update
    command

    if @command.update(command_params)
      redirect_to root_path, notice: t('helpers.notices.commands.edit_command')
    else
      render :edit
    end
  end

  def create
    @command = Command.new(command_params)

    if @command.save
      redirect_to root_path, notice: t('helpers.notices.commands.new_command')
    else
      render :new
    end
  end

  private

  def load_vim_modes
    @vim_modes = VimMode.to_a
  end

  def command
    @command ||= Command.find params[:id]
  end

  def command_params
    params.require(:command).permit(:command, :description, :vim_mode)
  end
end
