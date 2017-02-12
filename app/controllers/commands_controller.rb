class CommandsController < ApplicationController
  def new
    @command = Command.new
    load_modes
  end

  def create
    @command = Command.new(command_params)

    if @command.save
      redirect_to root_path, notice: "A new command has been added"
    else
      load_modes
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

  def load_modes
    @modes ||= Mode.all
  end

  def command_params
    params.require(:command).permit(:mode_id, :command, :description)
  end
end
