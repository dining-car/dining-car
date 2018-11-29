# frozen_string_literal: true

require "test_helper"

class RecipesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
    @account = users(:one).account
    @recipe = recipes(:one)
  end

  test "should get index" do
    get recipes_url
    assert_response :success
  end

  test "should get new" do
    get new_account_recipe_url(@account)
    assert_response :success
  end

  test "should create recipe" do
    assert_difference("Recipe.count") do
      post account_recipes_url(@account), params: { recipe: { info: @recipe.info, public: @recipe.public, title: @recipe.title, account_id: @recipe.account_id } }
    end

    created_recipe = Recipe.last
    assert_redirected_to short_account_recipe_url(created_recipe.account, created_recipe)
  end

  test "should create recipe with multiple sources" do
    assert_difference("Recipe.count") do
      post account_recipes_url(@account), params: { recipe: { info: @recipe.info, public: @recipe.public, title: @recipe.title, account_id: @recipe.account_id, source: "source1,source 2" } }
    end

    created_recipe = Recipe.last
    assert_equal ["source1", "source 2"], created_recipe.source
  end

  test "should show recipe" do
    get account_recipe_url(@recipe.account, @recipe)
    assert_response :success
  end

  test "should get edit" do
    get edit_account_recipe_url(@recipe.account, @recipe)
    assert_response :success
  end

  test "should update recipe" do
    patch account_recipe_url(@account, @recipe), params: { recipe: { info: @recipe.info, public: @recipe.public, title: @recipe.title, account_id: @recipe.account_id } }
    assert_redirected_to short_account_recipe_url(@recipe.account, @recipe)
  end

  test "should update recipe with multiple sources" do
    patch account_recipe_url(@account, @recipe), params: { recipe: { info: @recipe.info, public: @recipe.public, title: @recipe.title, account_id: @recipe.account_id, source: "source1,source 2"  } }
    @recipe.reload
    assert_equal ["source1", "source 2"], @recipe.source
  end


  test "should destroy recipe" do
    assert_difference("Recipe.count", -1) do
      delete account_recipe_url(@recipe.account, @recipe)
    end

    assert_redirected_to recipes_url
  end
end
