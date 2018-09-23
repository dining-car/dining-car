# frozen_string_literal: true

require "application_system_test_case"

class InstructionGroupsTest < ApplicationSystemTestCase
  setup do
    @instruction_group = instruction_groups(:one)
  end

  test "visiting the index" do
    visit instruction_groups_url
    assert_selector "h1", text: "Instruction Groups"
  end

  test "creating a Instruction group" do
    visit instruction_groups_url
    click_on "New Instruction Group"

    fill_in "Recipe", with: @instruction_group.recipe_id
    fill_in "Title", with: @instruction_group.title
    click_on "Create Instruction group"

    assert_text "Instruction group was successfully created"
    click_on "Back"
  end

  test "updating a Instruction group" do
    visit instruction_groups_url
    click_on "Edit", match: :first

    fill_in "Recipe", with: @instruction_group.recipe_id
    fill_in "Title", with: @instruction_group.title
    click_on "Update Instruction group"

    assert_text "Instruction group was successfully updated"
    click_on "Back"
  end

  test "destroying a Instruction group" do
    visit instruction_groups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Instruction group was successfully destroyed"
  end
end
