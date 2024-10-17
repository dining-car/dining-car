# frozen_string_literal: true

# This controller is only used to serve Turbo Streams for the recipe form
class IngredientGroupsController < ApplicationController
  before_action :set_recipe, only: :create
  before_action :set_id, only: :destroy

  private

    def set_recipe
      @recipe = Recipe.new(ingredient_groups: [IngredientGroup.new(ingredients: [Ingredient.new])])
    end

    def set_id
      @id = params[:id]
    end
end
