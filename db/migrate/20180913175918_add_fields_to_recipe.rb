# frozen_string_literal: true

class AddFieldsToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :preparation_time, :integer
    add_column :recipes, :cooking_time, :integer
    add_column :recipes, :servings, :integer
    add_column :recipes, :source, :string, array: true
  end
end
