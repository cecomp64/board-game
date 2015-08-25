class ModifiersController < ApplicationController
  before_action :set_modifier, only: [:show, :edit, :update, :destroy]

  # GET /modifiers
  # GET /modifiers.json
  def index
    @modifiers = Modifier.all
  end

  # GET /modifiers/1
  # GET /modifiers/1.json
  def show
  end

  # GET /modifiers/new
  def new
    @modifier = Modifier.new
  end

  # GET /modifiers/1/edit
  def edit
  end

  # POST /modifiers
  # POST /modifiers.json
  def create
    @modifier = Modifier.new(modifier_params)

    respond_to do |format|
      if @modifier.save
        format.html { redirect_to @modifier, notice: 'Modifier was successfully created.' }
        format.json { render :show, status: :created, location: @modifier }
      else
        format.html { render :new }
        format.json { render json: @modifier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /modifiers/1
  # PATCH/PUT /modifiers/1.json
  def update
    respond_to do |format|
      if @modifier.update(modifier_params)
        format.html { redirect_to @modifier, notice: 'Modifier was successfully updated.' }
        format.json { render :show, status: :ok, location: @modifier }
      else
        format.html { render :edit }
        format.json { render json: @modifier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /modifiers/1
  # DELETE /modifiers/1.json
  def destroy
    @modifier.destroy
    respond_to do |format|
      format.html { redirect_to modifiers_url, notice: 'Modifier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_modifier
      @modifier = Modifier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def modifier_params
      params.require(:modifier).permit(:space_id, :geography_id, :name, :roll, :draw, :move, :turn, :banked_turns)
    end
end
