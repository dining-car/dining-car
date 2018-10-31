# frozen_string_literal: true

class Unit < ApplicationRecord
  has_many :ingredients, inverse_of: :unit, dependent: :nullify
end
