# frozen_string_literal: true

class Cuisine < ApplicationRecord
  has_many :recipes, inverse_of: :cuisine

  validates :title, presence: true, uniqueness: { case_sensitive: false }

  scope :with_recipes_count, -> {
    select <<~SQL
      cuisines.*,
      (
        SELECT COUNT(recipes.id) FROM recipes
        WHERE cuisine_id = cuisines.id
      ) AS recipes_count
    SQL
  }
end
