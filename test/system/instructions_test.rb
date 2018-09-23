# frozen_string_literal: true

require "application_system_test_case"

class InstructionsTest < ApplicationSystemTestCase
  setup do
    @instruction = instructions(:one)
  end

  test "visiting the index" do
    visit instructions_url
    assert_selector "h1", text: "Instructions"
  end

  test "creating a Instruction" do
    visit instructions_url
    click_on "New Instruction"

    fill_in "Instruction Group", with: @instruction.instruction_group_id
    fill_in "Title", with: @instruction.title
    click_on "Create Instruction"

    assert_text "Instruction was successfully created"
    click_on "Back"
  end

  test "updating a Instruction" do
    visit instructions_url
    click_on "Edit", match: :first

    fill_in "Instruction Group", with: @instruction.instruction_group_id
    fill_in "Title", with: @instruction.title
    click_on "Update Instruction"

    assert_text "Instruction was successfully updated"
    click_on "Back"
  end

  test "destroying a Instruction" do
    visit instructions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Instruction was successfully destroyed"
  end
end
