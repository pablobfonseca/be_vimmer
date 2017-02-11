class CreateCommands < ActiveRecord::Migration[5.0]
  def change
    create_table :commands do |t|
      t.references :mode, foreign_key: true, index: true
      t.string :command
      t.string :description

      t.timestamps
    end
  end
end
