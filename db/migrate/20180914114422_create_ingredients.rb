# frozen_string_literal: true

class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :title
      t.references :ingredient_group, foreign_key: true
      t.string :quantity
      t.references :unit, foreign_key: true

      t.timestamps
    end
  end
end
