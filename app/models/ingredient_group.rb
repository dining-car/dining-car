# frozen_string_literal: true

class IngredientGroup < ApplicationRecord
  belongs_to :recipe, inverse_of: :ingredient_groups
  has_many :ingredients, inverse_of: :ingredient_group

  accepts_nested_attributes_for :ingredients

  validates :title, uniqueness: { scope: :recipe, case_sensitive: false }
end
