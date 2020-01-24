# frozen_string_literal: true

require "test_helper"

class RecipeIndexQueryTest < ActiveSupport::TestCase
  setup do
    @account = accounts(:one)
  end

  test "Query without sort should return results sorted by newer first" do
    user = nil
    search_query = nil
    course = nil
    cuisine = nil

    q = RecipeIndexQuery.new.query(nil, user, search_query, course, cuisine)

    assert_equal 2, q.count
    assert_equal recipes(:four), q.first
    assert_equal recipes(:three), q.second
  end

  test "Query sorted by title should return ordered by title" do
    user = nil
    search_query = nil
    course = nil
    cuisine = nil

    q = RecipeIndexQuery.new.query("title", user, search_query, course, cuisine)

    assert_equal 2, q.count
    assert_equal recipes(:three), q.first
    assert_equal recipes(:four), q.second
  end

  test "Query without user should not return private recipes" do
    sort_by = nil
    user = nil
    search_query = nil
    course = nil
    cuisine = nil

    q = RecipeIndexQuery.new.query(sort_by, user, search_query, course, cuisine)

    assert_equal 2, q.count
    assert_not_includes q, recipes(:one)
    assert_not_includes q, recipes(:two)
  end

  test "Query with user should not return private recipes from other users" do
    sort_by = nil
    user = accounts(:one).user
    search_query = nil
    course = nil
    cuisine = nil

    q = RecipeIndexQuery.new.query(sort_by, user, search_query, course, cuisine)

    assert_equal 3, q.count
    assert_not_includes q, recipes(:two)
  end

  test "Query with search query should return recipes where the partial term appears in the title" do
    sort_by = nil
    user = nil
    search_query = 'guac'
    course = nil
    cuisine = nil

    q = RecipeIndexQuery.new.query(sort_by, user, search_query, course, cuisine)

    assert_equal 1, q.count
    assert_equal recipes(:four), q.first
  end

  test "Query with cuisine should return only results with that cuisine" do
    sort_by = nil
    user = nil
    search_query = nil
    course = nil
    cuisine = cuisines(:one)

    q = RecipeIndexQuery.new.query(sort_by, user, search_query, course, cuisine)

    assert_equal 1, q.count
    assert_equal recipes(:four), q.first
  end

  test "Query with course should only return results with that course" do
    sort_by = nil
    user = nil
    search_query = nil
    course = courses(:one)
    cuisine = nil

    q = RecipeIndexQuery.new.query(sort_by, user, search_query, course, cuisine)

    assert_equal 1, q.count
    assert_equal recipes(:three), q.first
  end
end
