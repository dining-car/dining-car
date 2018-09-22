# frozen_string_literal: true

class Ingredient < ApplicationRecord
  belongs_to :ingredient_group
  belongs_to :unit
end
