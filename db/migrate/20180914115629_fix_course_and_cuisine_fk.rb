# frozen_string_literal: true

class FixCourseAndCuisineFk < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :recipes, :cuisines
    add_foreign_key :recipes, :courses
  end
end
