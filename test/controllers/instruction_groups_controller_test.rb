# frozen_string_literal: true

require "test_helper"

class InstructionGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @instruction_group = instruction_groups(:one)
  end

  test "should get index" do
    get instruction_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_instruction_group_url
    assert_response :success
  end

  test "should create instruction_group" do
    assert_difference("InstructionGroup.count") do
      post instruction_groups_url, params: { instruction_group: { recipe_id: @instruction_group.recipe_id, title: @instruction_group.title } }
    end

    assert_redirected_to instruction_group_url(InstructionGroup.last)
  end

  test "should show instruction_group" do
    get instruction_group_url(@instruction_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_instruction_group_url(@instruction_group)
    assert_response :success
  end

  test "should update instruction_group" do
    patch instruction_group_url(@instruction_group), params: { instruction_group: { recipe_id: @instruction_group.recipe_id, title: @instruction_group.title } }
    assert_redirected_to instruction_group_url(@instruction_group)
  end

  test "should destroy instruction_group" do
    assert_difference("InstructionGroup.count", -1) do
      delete instruction_group_url(@instruction_group)
    end

    assert_redirected_to instruction_groups_url
  end
end
