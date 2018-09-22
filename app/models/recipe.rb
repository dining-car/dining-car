# frozen_string_literal: true

class Recipe < ApplicationRecord
  paginates_per 16

  belongs_to :user

  scope :with_public, -> { where(public: true) }
  scope :search_for, -> (search) { where('title ilike ?', "%#{search}%") }
end
