# frozen_string_literal: true

require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  setup do
    @ingredient_group = ingredient_groups(:one)
  end

  test 'quantity that is a alphanumeric string gets rejected - exception' do
    assert_raises ActiveRecord::RecordInvalid do
      i = Ingredient.create!(ingredient_group: @ingredient_group, title: 'Onion', quantity: 'abc')
    end
  end

  test 'quantity that is a alphanumeric string gets rejected - errors' do
    i = Ingredient.create(ingredient_group: @ingredient_group, title: 'Onion', quantity: 'abc')
    assert 1, i.errors.count
  end

  test 'quantity that divides by zero gets rejected - exception' do
    assert_raises ActiveRecord::RecordInvalid do
      Ingredient.create!(ingredient_group: @ingredient_group, title: 'Onion', quantity: '1/0')
    end
  end
  test 'quantity that divides by zero gets rejected - errors' do
    i = Ingredient.create(ingredient_group: @ingredient_group, title: 'Onion', quantity: '1/0')
    assert 1, i.errors.count
  end

  test 'quantity that is empty space is accepted' do
    Ingredient.create!(ingredient_group: @ingredient_group, title: 'Onion', quantity: ' ')
  end

  test 'quantity that is nil is accepted' do
    Ingredient.create!(ingredient_group: @ingredient_group, title: 'Onion', quantity: nil)
  end

  test 'cannot create ingredient with empty title - exception' do
    assert_raises ActiveRecord::RecordInvalid do
      i = Ingredient.create!(ingredient_group: @ingredient_group)
    end
  end

  test 'cannot create ingredient with empty title - errors' do
    i = Ingredient.create(ingredient_group: @ingredient_group)
    assert 1, i.errors.count
  end
end
