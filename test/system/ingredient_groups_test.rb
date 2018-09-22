# frozen_string_literal: true

require "application_system_test_case"

class IngredientGroupsTest < ApplicationSystemTestCase
  setup do
    @ingredient_group = ingredient_groups(:one)
  end

  test "visiting the index" do
    visit ingredient_groups_url
    assert_selector "h1", text: "Ingredient Groups"
  end

  test "creating a Ingredient group" do
    visit ingredient_groups_url
    click_on "New Ingredient Group"

    fill_in "Recipe", with: @ingredient_group.recipe
    fill_in "Title", with: @ingredient_group.title
    click_on "Create Ingredient group"

    assert_text "Ingredient group was successfully created"
    click_on "Back"
  end

  test "updating a Ingredient group" do
    visit ingredient_groups_url
    click_on "Edit", match: :first

    fill_in "Recipe", with: @ingredient_group.recipe
    fill_in "Title", with: @ingredient_group.title
    click_on "Update Ingredient group"

    assert_text "Ingredient group was successfully updated"
    click_on "Back"
  end

  test "destroying a Ingredient group" do
    visit ingredient_groups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ingredient group was successfully destroyed"
  end
end
