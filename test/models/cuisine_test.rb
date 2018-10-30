# frozen_string_literal: true

require "test_helper"

class CuisineTest < ActiveSupport::TestCase
  test "Cannot create cuisine with empty name - exception" do
    assert_raises ActiveRecord::RecordInvalid do
      Cuisine.create!(title: "")
    end
  end

  test "Cannot create cuisine with empty name - errors" do
    c = Cuisine.create(title: "")
    assert_equal 1, c.errors.count
  end

  test "Cannot create two cuisines with the same name - exception" do
    Cuisine.create!(title: "Awesome")

    assert_raises ActiveRecord::RecordInvalid do
      Cuisine.create!(title: "awesome")
    end
  end

  test "Cannot create two cuisines with the same name - errors" do
    Cuisine.create!(title: "Awesome")

    c = Cuisine.create(title: "awesome")
    assert_equal 1, c.errors.count
  end
end
