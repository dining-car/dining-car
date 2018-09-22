# frozen_string_literal: true

class Course < ApplicationRecord
  has_many :recipes

  validates :title, presence: true, uniqueness: { case_sensitive: false }
end
