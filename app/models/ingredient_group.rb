# frozen_string_literal: true

class IngredientGroup < ApplicationRecord
  belongs_to :recipe

  validates :title, uniqueness: { scope: :recipe, case_sensitive: false }
end
