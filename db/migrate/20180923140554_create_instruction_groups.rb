# frozen_string_literal: true

class CreateInstructionGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :instruction_groups do |t|
      t.string :title
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end
