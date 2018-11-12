# frozen_string_literal: true

require "babosa"

MAX_RECIPE_PHOTO_AREA = 490_000 # 700px x 700px

class Recipe < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize.to_s
  end

  paginates_per 16

  belongs_to :account, inverse_of: :recipes
  belongs_to :course, optional: true, inverse_of: :recipes
  belongs_to :cuisine, optional: true, inverse_of: :recipes
  has_many :ingredient_groups, inverse_of: :recipe, dependent: :destroy
  has_many :instruction_groups, inverse_of: :recipe, dependent: :destroy

  has_one_attached :photo, acl: "public"
  validates :photo, size: { less_than: 10.megabytes, message: I18n.t("photo.size.too_big") }

  validates :title, presence: true

  accepts_nested_attributes_for :ingredient_groups, allow_destroy: true, reject_if: proc { |attributes| attributes["ingredients_attributes"].blank? || attributes["ingredients_attributes"].all? { |_, v| v["title"].blank? } }
  accepts_nested_attributes_for :instruction_groups, allow_destroy: true

  scope :by_title, -> { order(title: :asc) }
  scope :by_created_at, -> { order(created_at: :desc) }
  scope :with_public, -> { where(public: true) }
  scope :with_course, ->(course_id) { where(course_id: course_id) }
  scope :with_cuisine, ->(cuisine_id) { where(cuisine_id: cuisine_id) }
  scope :search_for, ->(search) { where("title ilike ?", "%#{search}%") }

  def main_picture_variant
    variation = ActiveStorage::Variation.new(ImageResizer.resize_on_bigger_size(max_area: MAX_RECIPE_PHOTO_AREA, blob: photo.blob))
    ActiveStorage::Variant.new(photo.blob, variation)
  end
end
