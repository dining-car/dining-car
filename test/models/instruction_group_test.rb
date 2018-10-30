# frozen_string_literal: true

require "test_helper"

class InstructionGroupTest < ActiveSupport::TestCase
  setup do
    @recipe = recipes(:one)
  end

  test "Can create instruction group with empty name" do
    assert_difference("InstructionGroup.count") do
      InstructionGroup.create!(title: "", instructions: "Mix everything", recipe: @recipe)
    end
  end

  test "Cannot create multiple instruction group with the same name in the same recipe - exception" do
    InstructionGroup.create!(title: "Dough", instructions: "Mix everything", recipe: @recipe)

    assert_raises ActiveRecord::RecordInvalid do
      InstructionGroup.create!(title: "dough", instructions: "Mix everything", recipe: @recipe)
    end
  end

  test "Cannot create multiple instruction group with the same name in the same recipe - errors" do
    InstructionGroup.create!(title: "Dough", instructions: "Mix everything", recipe: @recipe)

    ig = InstructionGroup.create(title: "dough", instructions: "Mix everything", recipe: @recipe)
    assert_equal 1, ig.errors.count
  end

  test "Cannot create instruction group without recipe - exception" do
    assert_raises ActiveRecord::RecordInvalid do
      InstructionGroup.create!(title: "Dough", instructions: "Mix everything")
    end
  end

  test "Cannot create instruction group without recipe - errors" do
    ig = InstructionGroup.create(title: "Dough", instructions: "Mix everything")
    assert_equal 1, ig.errors.count
  end

  test "Cannot create instruction group with instructions - exception" do
    assert_raises ActiveRecord::RecordInvalid do
      InstructionGroup.create!(title: "", recipe: @recipe)
    end
  end

  test "Cannot create instruction group with instructions - errors" do
    ig = InstructionGroup.create(title: "", recipe: @recipe)
    assert_equal 1, ig.errors.count
  end
end
