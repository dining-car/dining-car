# frozen_string_literal: true

# This controller is only used to serve Turbo Streams for the recipe form
class IngredientsController < ApplicationController
  before_action :set_ingredient_group, :set_recipe, :set_ingredient_group_index
  before_action :set_id, only: :destroy

  private

    def set_ingredient_group_index
      @ingredient_group_index = params[:ingredient_group_index]
    end

    def set_ingredient_group
      @ingredient_group = IngredientGroup.new(ingredients: [Ingredient.new])
    end

    def set_recipe
      @recipe = Recipe.new
      @recipe.ingredient_groups << @ingredient_group
    end

    def set_id
      @id = params[:id]
    end
end
