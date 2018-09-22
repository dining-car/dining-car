# frozen_string_literal: true

class Course < ApplicationRecord
  has_many :recipes, inverse_of: :course

  validates :title, presence: true, uniqueness: { case_sensitive: false }

  scope :with_recipes_count, -> {
    select <<~SQL
      courses.*,
      (
        SELECT COUNT(recipes.id) FROM recipes
        WHERE course_id = courses.id
      ) AS recipes_count
    SQL
  }
end
