class VimMode < EnumerateIt::Base
  associate_values(
    normal_mode: 1,
    visual_mode: 2,
    insert_mode: 3,
    sub_mode: 4,
    text_objects: 5,
    window_commands: 6,
    command_line_mode: 7,
    ex_mode: 8
  )
end
