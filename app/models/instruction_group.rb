# frozen_string_literal: true

class InstructionGroup < ApplicationRecord
  belongs_to :recipe, inverse_of: :instruction_groups
  has_many :instructions, inverse_of: :instruction_group

  accepts_nested_attributes_for :instructions, allow_destroy: true, reject_if: proc { |attributes| attributes['body'].blank? }

  validates :title, uniqueness: { scope: :recipe, case_sensitive: false }
end
