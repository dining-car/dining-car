# frozen_string_literal: true

class UnitsController < ApplicationController
  before_action :set_unit, only: [:show, :edit, :update, :destroy]

  # GET /units
  def index
    authorize :unit, :index?
    @units = Unit.all
  end

  # GET /units/1
  def show
    authorize @unit, :show?
  end

  # GET /units/new
  def new
    @unit = Unit.new
    authorize @unit, :new?
  end

  # GET /units/1/edit
  def edit
    authorize @unit, :edit?
  end

  # POST /units
  def create
    @unit = Unit.new(unit_params)
    authorize @unit, :create?

    if @unit.save
      redirect_to @unit, notice: "Unit was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /units/1
  def update
    authorize @unit, :update?
    if @unit.update(unit_params)
      redirect_to @unit, notice: "Unit was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /units/1
  def destroy
    authorize @unit, :destroy?
    @unit.destroy
    redirect_to units_url, notice: "Unit was successfully destroyed.", status: :see_other
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_unit
      @unit = Unit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unit_params
      params.require(:unit).permit(:title)
    end
end
