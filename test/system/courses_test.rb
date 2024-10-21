# frozen_string_literal: true

require "application_system_test_case"

class CoursesTest < ApplicationSystemTestCase
  setup do
    @course = courses(:one)
    sign_in users(:admin)
  end

  test "visiting the index" do
    visit courses_url
    assert_selector "h1", text: "Course"
  end

  test "creating a Course that already exists and fails" do
    visit courses_url
    click_on "New"

    fill_in "Title", with: @course.title
    click_on "Create Course"

    assert_text "Title has already been taken"
  end

  test "creating a Course" do
    visit courses_url
    click_on "New"

    fill_in "Title", with: "New course"
    click_on "Create Course"

    assert_text "Course was successfully created"
  end

  test "updating a Course" do
    visit courses_url
    click_on "Edit", match: :first

    fill_in "Title", with: @course.title
    click_on "Update Course"

    assert_text "Course was successfully updated"
  end

  test "destroying a Course" do
    visit courses_url
    page.accept_confirm do
      within find("tr", text: "Unused") do
        click_on "Destroy", match: :first
      end
    end

    assert_text "Course was successfully destroyed"
  end
end
