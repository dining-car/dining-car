# frozen_string_literal: true

class InstructionGroupsController < ApplicationController
  before_action :set_instruction_group, only: [:show, :edit, :update, :destroy]

  # GET /instruction_groups
  # GET /instruction_groups.json
  def index
    authorize :instruction_group, :index?
    @instruction_groups = InstructionGroup.all
  end

  # GET /instruction_groups/1
  # GET /instruction_groups/1.json
  def show
    authorize @instruction_group, :show?
  end

  # GET /instruction_groups/new
  def new
    @instruction_group = InstructionGroup.new
    authorize @instruction_group, :new?
  end

  # GET /instruction_groups/1/edit
  def edit
    authorize @instruction_group, :edit?
  end

  # POST /instruction_groups
  # POST /instruction_groups.json
  def create
    @instruction_group = InstructionGroup.new(instruction_group_params)
    authorize @instruction_group, :create?

    respond_to do |format|
      if @instruction_group.save
        format.html { redirect_to @instruction_group, notice: "Instruction group was successfully created." }
        format.json { render :show, status: :created, location: @instruction_group }
      else
        format.html { render :new }
        format.json { render json: @instruction_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instruction_groups/1
  # PATCH/PUT /instruction_groups/1.json
  def update
    authorize @instruction_group, :update?
    respond_to do |format|
      if @instruction_group.update(instruction_group_params)
        format.html { redirect_to @instruction_group, notice: "Instruction group was successfully updated." }
        format.json { render :show, status: :ok, location: @instruction_group }
      else
        format.html { render :edit }
        format.json { render json: @instruction_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instruction_groups/1
  # DELETE /instruction_groups/1.json
  def destroy
    authorize @instruction_group, :destroy?
    @instruction_group.destroy
    respond_to do |format|
      format.html { redirect_to instruction_groups_url, notice: "Instruction group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instruction_group
      @instruction_group = InstructionGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instruction_group_params
      params.require(:instruction_group).permit(:title, :recipe_id)
    end
end
