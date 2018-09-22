# frozen_string_literal: true

class Cuisine < ApplicationRecord
  has_many :recipes
end
