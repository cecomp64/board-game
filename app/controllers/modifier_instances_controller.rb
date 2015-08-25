class ModifierInstancesController < ApplicationController
  before_action :set_modifier_instance, only: [:show, :edit, :update, :destroy]

  # GET /modifier_instances
  # GET /modifier_instances.json
  def index
    @modifier_instances = ModifierInstance.all
  end

  # GET /modifier_instances/1
  # GET /modifier_instances/1.json
  def show
  end

  # GET /modifier_instances/new
  def new
    @modifier_instance = ModifierInstance.new
  end

  # GET /modifier_instances/1/edit
  def edit
  end

  # POST /modifier_instances
  # POST /modifier_instances.json
  def create
    @modifier_instance = ModifierInstance.new(modifier_instance_params)

    respond_to do |format|
      if @modifier_instance.save
        format.html { redirect_to @modifier_instance, notice: 'Modifier instance was successfully created.' }
        format.json { render :show, status: :created, location: @modifier_instance }
      else
        format.html { render :new }
        format.json { render json: @modifier_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /modifier_instances/1
  # PATCH/PUT /modifier_instances/1.json
  def update
    respond_to do |format|
      if @modifier_instance.update(modifier_instance_params)
        format.html { redirect_to @modifier_instance, notice: 'Modifier instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @modifier_instance }
      else
        format.html { render :edit }
        format.json { render json: @modifier_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /modifier_instances/1
  # DELETE /modifier_instances/1.json
  def destroy
    @modifier_instance.destroy
    respond_to do |format|
      format.html { redirect_to modifier_instances_url, notice: 'Modifier instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_modifier_instance
      @modifier_instance = ModifierInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def modifier_instance_params
      params.require(:modifier_instance).permit(:geography_id, :space_id, :modifier_id, :character_id, :character)
    end
end
