# frozen_string_literal: true

class CuisinesController < ApplicationController
  before_action :set_cuisine, only: [:show, :edit, :update, :destroy]

  # GET /cuisines
  def index
    authorize :cuisine, :index?
    @cuisines = Cuisine.all
  end

  # GET /cuisines/1
  def show
    authorize @cuisine, :show?
  end

  # GET /cuisines/new
  def new
    @cuisine = Cuisine.new
    authorize @cuisine, :new?
  end

  # GET /cuisines/1/edit
  def edit
    authorize @cuisine, :edit?
  end

  # POST /cuisines
  def create
    @cuisine = Cuisine.new(cuisine_params)
    authorize @cuisine, :create?

    if @cuisine.save
      flash[:success] = "Cuisine was successfully created."
      redirect_to @cuisine
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cuisines/1
  def update
    authorize @cuisine, :update?
    if @cuisine.update(cuisine_params)
      flash[:success] = "Cuisine was successfully updated."
      redirect_to @cuisine
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /cuisines/1
  def destroy
    authorize @cuisine, :destroy?
    @cuisine.destroy
    redirect_to cuisines_url, notice: "Cuisine was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cuisine
      @cuisine = Cuisine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cuisine_params
      params.require(:cuisine).permit(:title)
    end
end
