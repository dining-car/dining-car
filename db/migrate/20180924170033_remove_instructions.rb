# frozen_string_literal: true

class RemoveInstructions < ActiveRecord::Migration[5.2]
  def change
    add_column :instruction_groups, :instructions, :text
    InstructionGroup.update_all(instructions: 'add text here')
    change_column :instruction_groups, :instructions, :text

    drop_table :instructions do |t|
      t.text :body
      t.references :instruction_group, foreign_key: true

      t.timestamps
    end
  end
end
