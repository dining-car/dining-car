# frozen_string_literal: true

require "application_system_test_case"

class UnitsTest < ApplicationSystemTestCase
  setup do
    @unit = units(:one)
    sign_in users(:admin)
  end

  test "visiting the index" do
    visit units_url
    assert_selector "h1", text: "Unit"
  end

  test "creating a Unit" do
    visit units_url
    click_on "New"

    fill_in "Title", with: @unit.title
    click_on "Create Unit"

    assert_text "Unit was successfully created"
  end

  test "updating a Unit" do
    visit units_url
    click_on "Edit", match: :first

    fill_in "Title", with: @unit.title
    click_on "Update Unit"

    assert_text "Unit was successfully updated"
  end

  test "destroying a Unit" do
    visit units_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Unit was successfully destroyed"
  end
end
