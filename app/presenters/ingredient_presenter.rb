# frozen_string_literal: true

class IngredientPresenter
  delegate_missing_to :@ingredient

  def initialize(ingredient, view)
    @ingredient = ingredient
    @view = view
  end

  attr_accessor :ingredient

  def quantity
    return "" if @ingredient.quantity.nil?

    quantity_rational = @ingredient.quantity.to_r
    if quantity_rational.denominator == 1
      return quantity_rational.numerator
    end
    quantity_rational
  end

  def unit
    @ingredient.unit&.title
  end
end
