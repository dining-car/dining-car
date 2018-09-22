# frozen_string_literal: true

class CreateCuisines < ActiveRecord::Migration[5.2]
  def change
    create_table :cuisines do |t|
      t.string :title

      t.timestamps
    end

    add_reference :recipes, :cuisine, index: true
  end
end
