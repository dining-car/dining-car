# frozen_string_literal: true

require "test_helper"

class CuisinesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:admin)
    @cuisine = cuisines(:unused)
  end

  test "should get index" do
    get cuisines_url
    assert_response :success
  end

  test "should get new" do
    get new_cuisine_url
    assert_response :success
  end

  test "should create cuisine" do
    assert_difference("Cuisine.count") do
      post cuisines_url, params: { cuisine: { title: "Martian" } }
    end

    assert_redirected_to cuisine_url(Cuisine.last)
  end

  test "should show cuisine" do
    get cuisine_url(@cuisine)
    assert_response :success
  end

  test "should get edit" do
    get edit_cuisine_url(@cuisine)
    assert_response :success
  end

  test "should update cuisine" do
    patch cuisine_url(@cuisine), params: { cuisine: { title: "Whovian" } }
    assert_redirected_to cuisine_url(@cuisine)
  end

  test "should destroy cuisine" do
    assert_difference("Cuisine.count", -1) do
      delete cuisine_url(@cuisine)
    end

    assert_redirected_to cuisines_url
  end
end
