# frozen_string_literal: true

require "application_system_test_case"

class RecipesTest < ApplicationSystemTestCase
  setup do
    @recipe = recipes(:one)
    sign_in users(:one)
  end

  # test "visiting the index" do
  #   visit recipes_url
  #   assert_selector "h1", text: "Recipes"
  # end

  test "creating a Recipe" do
    visit recipes_url
    click_on "Create recipe"

    fill_in "Name", with: @recipe.title
    fill_in "Info", with: @recipe.info
    fill_in "Instructions", with: @recipe.instruction_groups.first.instructions
    # check "Public", option: @recipe.public
    click_on "Create Recipe"

    assert_text "Recipe was successfully created"
  end

  test "updating a Recipe" do
    visit account_recipe_url(@recipe.account, @recipe)
    click_on "Edit", match: :first

    fill_in "Name", with: @recipe.title
    fill_in "Info", with: @recipe.info
    fill_in "Instructions", with: @recipe.instruction_groups.first.instructions
    # check "Public", option: @recipe.public
    click_on "Update Recipe"

    assert_text "Recipe was successfully updated"
  end

  test "destroying a Recipe" do
    visit account_recipe_url(@recipe.account, @recipe)
    page.accept_confirm do
      click_on "Delete", match: :first
    end

    assert_text "Recipe was successfully destroyed"
  end
end
