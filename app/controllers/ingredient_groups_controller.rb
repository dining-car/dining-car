# frozen_string_literal: true

class IngredientGroupsController < ApplicationController
  before_action :set_ingredient_group, only: [:show, :edit, :update, :destroy]

  # GET /ingredient_groups
  # GET /ingredient_groups.json
  def index
    authorize :ingredient_group, :index?
    @ingredient_groups = IngredientGroup.all
  end

  # GET /ingredient_groups/1
  # GET /ingredient_groups/1.json
  def show
    authorize @ingredient_group, :show?
  end

  # GET /ingredient_groups/new
  def new
    @ingredient_group = IngredientGroup.new
    authorize @ingredient_group, :new?
  end

  # GET /ingredient_groups/1/edit
  def edit
    authorize @ingredient_group, :edit?
  end

  # POST /ingredient_groups
  # POST /ingredient_groups.json
  def create
    @ingredient_group = IngredientGroup.new(ingredient_group_params)
    authorize @ingredient_group, :create?

    respond_to do |format|
      if @ingredient_group.save
        format.html { redirect_to @ingredient_group, notice: 'Ingredient group was successfully created.' }
        format.json { render :show, status: :created, location: @ingredient_group }
      else
        format.html { render :new }
        format.json { render json: @ingredient_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingredient_groups/1
  # PATCH/PUT /ingredient_groups/1.json
  def update
    authorize @ingredient_group, :update?
    respond_to do |format|
      if @ingredient_group.update(ingredient_group_params)
        format.html { redirect_to @ingredient_group, notice: 'Ingredient group was successfully updated.' }
        format.json { render :show, status: :ok, location: @ingredient_group }
      else
        format.html { render :edit }
        format.json { render json: @ingredient_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredient_groups/1
  # DELETE /ingredient_groups/1.json
  def destroy
    authorize @ingredient_group, :destroy?
    @ingredient_group.destroy
    respond_to do |format|
      format.html { redirect_to ingredient_groups_url, notice: 'Ingredient group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient_group
      @ingredient_group = IngredientGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_group_params
      params.require(:ingredient_group).permit(:title, :recipe)
    end
end
