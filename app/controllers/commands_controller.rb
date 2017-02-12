class CommandsController < ApplicationController
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

  def normal_mode
    @commands = Command.normal_mode
  end

  def visual_mode
    @commands = Command.visual_mode
  end

  private

  def command
    @command ||= Command.find params[:id]
  end

  def command_params
    params.require(:command).permit(:mode_id, :command, :description)
  end
end
