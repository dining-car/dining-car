# frozen_string_literal: true

class CreateInstructions < ActiveRecord::Migration[5.2]
  def change
    create_table :instructions do |t|
      t.text :body
      t.references :instruction_group, foreign_key: true

      t.timestamps
    end
  end
end
