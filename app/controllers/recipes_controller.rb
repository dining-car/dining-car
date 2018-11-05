# frozen_string_literal: true

class RecipesController < ApplicationController
  before_action :set_account, only: [:show]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :set_course, only: [:index]
  before_action :set_cuisine, only: [:index]
  before_action :set_safe_params, only: [:index]
  before_action :authenticate_user!, except: [:show, :index]

  # GET /recipes
  # GET /recipes.json
  def index
    authorize :recipe, :index?
    @recipes = Recipe.all
    @recipes = if params[:sort_by] == "title"
      @recipes.by_title
    else
      @recipes.by_created_at
    end
    @recipes = @recipes.with_public if current_user.blank?
    @recipes = @recipes.search_for(params[:search]) if params[:search]
    @recipes = @recipes.with_course(@course) if @course
    @recipes = @recipes.with_cuisine(@cuisine) if @cuisine
    @recipes = @recipes.page params[:page]
    @courses = Course.all.with_recipes_count
    @cuisines = Cuisine.all.with_recipes_count
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    authorize @recipe, :show?
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new(account: current_account, public: true)
    ingredient_group = @recipe.ingredient_groups.build
    6.times do
      ingredient_group.ingredients.build
    end
    instruction_group = @recipe.instruction_groups.build
    authorize @recipe, :new?
  end

  # GET /recipes/1/edit
  def edit
    authorize @recipe, :edit?
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params.merge(account: current_account))

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: "Recipe was successfully created." }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    authorize @recipe, :update?
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: "Recipe was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    authorize @recipe, :destroy?
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: "Recipe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_account
      @account = Account.find_local!(params[:account_username])
    end

    def set_course
      @course = Course.find_by_id(params[:course_id])
    end

    def set_cuisine
      @cuisine = Cuisine.find_by_id(params[:cuisine_id])
    end

    def set_recipe
      @recipe = Recipe.eager_load(ingredient_groups: { ingredients: :unit }).find(params[:id])
    end

    def set_safe_params
      @safe_params = params.permit(:course_id, :search, :cuisine_id, :sort_by)
    end

    def recipe_params
      params.require(:recipe).permit(:title, :info, :public, :search, :photo, :course_id, :cuisine_id, :preparation_time, :cooking_time, :servings, :source, ingredient_groups_attributes: [:id, :title, :_destroy, ingredients_attributes: %i[id title unit_id quantity _destroy]], instruction_groups_attributes: [:id, :title, :instructions, :_destroy])
    end
end
