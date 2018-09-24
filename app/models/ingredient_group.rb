# frozen_string_literal: true

class IngredientGroup < ApplicationRecord
  belongs_to :recipe, inverse_of: :ingredient_groups
  has_many :ingredients, inverse_of: :ingredient_group, dependent: :delete_all

  accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: proc { |attributes| attributes['title'].blank? }

  validates :title, uniqueness: { scope: :recipe, case_sensitive: false }
end
