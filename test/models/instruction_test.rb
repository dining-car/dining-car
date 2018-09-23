# frozen_string_literal: true

require 'test_helper'

class InstructionTest < ActiveSupport::TestCase
  setup do
    @instruction_group = instruction_groups(:one)
  end

  test 'cannot create instruction with empty body - exception' do
    assert_raises ActiveRecord::RecordInvalid do
      i = Instruction.create!(instruction_group: @instruction_group)
    end
  end

  test 'cannot create instruction with empty body - errors' do
    i = Instruction.create(instruction_group: @instruction_group)
    assert 1, i.errors.count
  end

  test 'Can create correct instruction' do
    i = Instruction.create(instruction_group: @instruction_group, body: 'Test')
    assert 0, i.errors.count
  end
end
