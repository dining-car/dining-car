# frozen_string_literal: true

class Ingredient < ApplicationRecord
  belongs_to :ingredient_group, inverse_of: :ingredients
  belongs_to :unit, optional: true, inverse_of: :ingredients

  validate :quantity_is_rational

  private

  def quantity_is_rational
    return self.quantity = nil if quantity.nil? || quantity.strip.empty?
    begin
      self.quantity = Rational(quantity)
    rescue ArgumentError, ZeroDivisionError
      errors.add(:quantity, I18n.t(:quantity_is_rational))
    end
  end
end
