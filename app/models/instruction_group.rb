# frozen_string_literal: true

class InstructionGroup < ApplicationRecord
  belongs_to :recipe, inverse_of: :instruction_groups

  validates :title, uniqueness: { scope: :recipe, case_sensitive: false }
  validates :instructions, presence: true
end
