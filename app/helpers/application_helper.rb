module ApplicationHelper
  def format_command command
    return if command.nil?

    content_tag :div, class: 'command' do
      concat(content_tag :h4, "Command of the day: ")
      concat(content_tag :p, "#{command.command}: #{command.description}")
    end
  end
end
