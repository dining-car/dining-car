# frozen_string_literal: true

require "application_system_test_case"

class CuisinesTest < ApplicationSystemTestCase
  setup do
    @cuisine = cuisines(:one)
    sign_in users(:admin)
  end

  test "visiting the index" do
    visit cuisines_url
    assert_selector "h1", text: "Cuisine"
  end

  test "creating a Cuisine that already exists and fails" do
    visit cuisines_url
    click_on "New"

    fill_in "Title", with: @cuisine.title
    click_on "Create Cuisine"

    assert_text "Title has already been taken"
  end

  test "creating a Cuisine" do
    visit cuisines_url
    click_on "New"

    fill_in "Title", with: "New cuisine"
    click_on "Create Cuisine"

    assert_text "Cuisine was successfully created"
  end

  test "updating a Cuisine" do
    visit cuisines_url
    click_on "Edit", match: :first

    fill_in "Title", with: @cuisine.title
    click_on "Update Cuisine"

    assert_text "Cuisine was successfully updated"
  end

  test "destroying a Cuisine" do
    visit cuisines_url
    page.accept_confirm do
      within find("tr", text: "Unused") do
        click_on "Destroy", match: :first
      end
    end

    assert_text "Cuisine was successfully destroyed"
  end
end
