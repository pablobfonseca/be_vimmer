class AlterColumnModeIdOnCommands < ActiveRecord::Migration[5.0]
  def change
    remove_column :commands, :mode_id
    add_column :commands, :vim_mode, :integer, null: false, default: 0
    add_index :commands, :vim_mode
  end
end
