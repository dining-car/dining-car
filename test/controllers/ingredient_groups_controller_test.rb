# frozen_string_literal: true

require 'test_helper'

class IngredientGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ingredient_group = ingredient_groups(:one)
  end

  test "should get index" do
    get ingredient_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_ingredient_group_url
    assert_response :success
  end

  test "should create ingredient_group" do
    assert_difference('IngredientGroup.count') do
      post ingredient_groups_url, params: { ingredient_group: { recipe: @ingredient_group.recipe, title: @ingredient_group.title } }
    end

    assert_redirected_to ingredient_group_url(IngredientGroup.last)
  end

  test "should show ingredient_group" do
    get ingredient_group_url(@ingredient_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_ingredient_group_url(@ingredient_group)
    assert_response :success
  end

  test "should update ingredient_group" do
    patch ingredient_group_url(@ingredient_group), params: { ingredient_group: { recipe: @ingredient_group.recipe, title: @ingredient_group.title } }
    assert_redirected_to ingredient_group_url(@ingredient_group)
  end

  test "should destroy ingredient_group" do
    assert_difference('IngredientGroup.count', -1) do
      delete ingredient_group_url(@ingredient_group)
    end

    assert_redirected_to ingredient_groups_url
  end
end
