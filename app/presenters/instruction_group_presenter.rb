# frozen_string_literal: true

class InstructionGroupPresenter
  delegate_missing_to :@instruction_group

  def initialize(instruction_group, view)
    @instruction_group = instruction_group
    @view = view
  end

  attr_accessor :instruction_group

  def instructions
    @instruction_group.instructions&.split("\n")
  end
end
