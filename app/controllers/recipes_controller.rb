# frozen_string_literal: true

class RecipesController < ApplicationController
  before_action :set_account, only: [:show]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :set_course, only: [:index]
  before_action :set_cuisine, only: [:index]
  before_action :set_safe_params, only: [:index]
  before_action :authenticate_user!, except: [:show, :index]

  # GET /recipes
  def index
    authorize :recipe, :index?
    @recipes = RecipeIndexQuery.new.query(params[:sort_by], current_user, params[:search], @course, @cuisine)
    @recipes = @recipes.page params[:page]
    @courses = Course.all.with_recipes_count
    @cuisines = Cuisine.all.with_recipes_count
  end

  # GET /recipes/1
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
  def create
    @recipe = Recipe.new(recipe_params.merge(account: current_account, source: recipe_params["source"]&.split(",")))

    if @recipe.save
      redirect_to short_account_recipe_url(@recipe.account, @recipe), notice: "Recipe was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /recipes/1
  def update
    authorize @recipe, :update?
    if @recipe.update(recipe_params.merge(source: recipe_params["source"]&.split(",")))
      redirect_to short_account_recipe_url(@recipe.account, @recipe), notice: "Recipe was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /recipes/1
  def destroy
    authorize @recipe, :destroy?
    @recipe.destroy
    redirect_to recipes_url, notice: "Recipe was successfully destroyed."
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
      @recipe = Recipe.eager_load(ingredient_groups: { ingredients: :unit }).friendly.find(params[:id])
    end

    def set_safe_params
      @safe_params = params.permit(:course_id, :search, :cuisine_id, :sort_by)
    end

    def recipe_params
      params.require(:recipe).permit(:title, :info, :public, :search, :photo, :course_id, :cuisine_id, :preparation_time, :cooking_time, :servings, :source, ingredient_groups_attributes: [:id, :title, :_destroy, ingredients_attributes: %i[id title unit_id quantity _destroy]], instruction_groups_attributes: [:id, :title, :instructions, :_destroy])
    end
end
