class CommandsController < ApplicationController
  def new
    @command = Command.new
    @modes = Mode.all
  end

  def create
    @command = Command.new(command_params)

    if @command.save
      redirect_to root_path, notice: "A new command has been added"
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

  def command_params
    params.require(:command).permit(:mode_id, :command, :description)
  end
end
