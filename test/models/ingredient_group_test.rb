# frozen_string_literal: true

require 'test_helper'

class IngredientGroupTest < ActiveSupport::TestCase
  setup do
    @recipe = recipes(:one)
  end

  test 'Can create ingredient group with empty name' do
    assert_difference('IngredientGroup.count') do
      IngredientGroup.create!(title: '', recipe: @recipe)
    end
  end

  test 'Cannot create multiple ingredient group with the same name in the same recipe - exception' do
    IngredientGroup.create!(title: 'Dough', recipe: @recipe)

    assert_raises ActiveRecord::RecordInvalid do
      IngredientGroup.create!(title: 'dough', recipe: @recipe)
    end
  end

  test 'Cannot create multiple ingredient group with the same name in the same recipe - errors' do
    IngredientGroup.create!(title: 'Dough', recipe: @recipe)

    ig = IngredientGroup.create(title: 'dough', recipe: @recipe)
    assert_equal 1, ig.errors.count
  end

  test 'Cannot create ingredient group without recipe - exception' do
    assert_raises ActiveRecord::RecordInvalid do
      IngredientGroup.create!(title: 'Dough')
    end
  end

  test 'Cannot create ingredient group without recipe - errors' do
    ig = IngredientGroup.create(title: 'Dough')
    assert_equal 1, ig.errors.count
  end
end
