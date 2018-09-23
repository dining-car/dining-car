# frozen_string_literal: true

class Recipe < ApplicationRecord
  paginates_per 16

  belongs_to :account, inverse_of: :recipes
  belongs_to :course, optional: true, inverse_of: :recipes
  belongs_to :cuisine, optional: true, inverse_of: :recipes
  has_many :ingredient_groups, inverse_of: :recipe
  has_many :instruction_groups, inverse_of: :recipe

  validates :title, presence: true

  accepts_nested_attributes_for :ingredient_groups, allow_destroy: true, reject_if: proc { |attributes| attributes['ingredients_attributes'].blank? || attributes['ingredients_attributes'].all? { |_, v| v['title'].blank? } }
  accepts_nested_attributes_for :instruction_groups, allow_destroy: true, reject_if: proc { |attributes| attributes['instructions_attributes'].blank? || attributes['instructions_attributes'].all? { |_, v| v['body'].blank? } }

  scope :by_title, -> { order(title: :asc) }
  scope :by_created_at, -> { order(created_at: :desc) }
  scope :with_public, -> { where(public: true) }
  scope :with_course, ->(course_id) { where(course_id: course_id) }
  scope :with_cuisine, ->(cuisine_id) { where(cuisine_id: cuisine_id) }
  scope :search_for, ->(search) { where('title ilike ?', "%#{search}%") }
end
