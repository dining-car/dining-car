# frozen_string_literal: true

class InstructionsController < ApplicationController
  before_action :set_instruction, only: [:show, :edit, :update, :destroy]

  # GET /instructions
  # GET /instructions.json
  def index
    authorize :instruction, :index?
    @instructions = Instruction.all
  end

  # GET /instructions/1
  # GET /instructions/1.json
  def show
    authorize @instruction, :show?
  end

  # GET /instructions/new
  def new
    @instruction = Instruction.new
    authorize @instruction, :new?
  end

  # GET /instructions/1/edit
  def edit
    authorize @instruction, :edit?
  end

  # POST /instructions
  # POST /instructions.json
  def create
    @instruction = Instruction.new(instruction_params)
    authorize @instruction, :create?

    respond_to do |format|
      if @instruction.save
        format.html { redirect_to @instruction, notice: 'Instruction was successfully created.' }
        format.json { render :show, status: :created, location: @instruction }
      else
        format.html { render :new }
        format.json { render json: @instruction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instructions/1
  # PATCH/PUT /instructions/1.json
  def update
    authorize @instruction, :update?
    respond_to do |format|
      if @instruction.update(instruction_params)
        format.html { redirect_to @instruction, notice: 'Instruction was successfully updated.' }
        format.json { render :show, status: :ok, location: @instruction }
      else
        format.html { render :edit }
        format.json { render json: @instruction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instructions/1
  # DELETE /instructions/1.json
  def destroy
    authorize @instruction, :destroy?
    @instruction.destroy
    respond_to do |format|
      format.html { redirect_to instructions_url, notice: 'Instruction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instruction
      @instruction = Instruction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instruction_params
      params.require(:instruction).permit(:title, :instruction_group_id)
    end
end
