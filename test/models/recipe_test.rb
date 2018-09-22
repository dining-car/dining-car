# frozen_string_literal: true

require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test 'Cannot create recipe with empty name - exception' do
    assert_raises ActiveRecord::RecordInvalid do
      Recipe.create!(title: '', user: @user)
    end
  end

  test 'Cannot create recipe with empty name - errors' do
    r = Recipe.create(title: '', user: @user)
    assert_equal 1, r.errors.count
  end

  test 'Cannot create recipe without user - exception' do
    assert_raises ActiveRecord::RecordInvalid do
      Recipe.create!(title: 'My cool recipe')
    end
  end

  test 'Cannot create recipe without user - errors' do
    r = Recipe.create(title: 'My cool recipe')
    assert_equal 1, r.errors.count
  end
end
