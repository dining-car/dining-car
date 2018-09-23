# frozen_string_literal: true

class Instruction < ApplicationRecord
  belongs_to :instruction_group, inverse_of: :instructions

  validates :body, presence: true
end
