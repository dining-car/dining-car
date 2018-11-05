# frozen_string_literal: true

class RecipePresenter
  delegate_missing_to :@recipe

  def initialize(recipe, view)
    @recipe = recipe
    @view = view
  end
  attr_accessor :recipe

  def total_time
    preparation_time + cooking_time
  end
end
