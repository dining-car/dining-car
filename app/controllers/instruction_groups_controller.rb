# frozen_string_literal: true

# This controller is only used to serve Turbo Streams for the recipe form
class InstructionGroupsController < ApplicationController
  before_action :set_recipe, only: :create
  before_action :set_id, only: :destroy

  private

    def set_recipe
      @recipe = Recipe.new(instruction_groups: [InstructionGroup.new])
    end

    def set_id
      @id = params[:id]
    end
end
