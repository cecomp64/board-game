class HelpersController < ApplicationController
  before_action :set_helper, only: [:show, :edit, :update, :destroy]

  # GET /helpers
  # GET /helpers.json
  def index
    @helpers = Helper.all
    @good = @helpers.select{|h| h.good?}
    @bad = @helpers.select{|h| h.bad?}
    @nuetral = @helpers.select{|h| h.nuetral?}
  end

  # GET /helpers/1
  # GET /helpers/1.json
  def show
  end

  # GET /helpers/new
  def new
    @helper = Helper.new
  end

  # GET /helpers/1/edit
  def edit
  end

  def add_modifier
    mid = params[:modifier]
    gid = params[:geography]
    sid = params[:space]
    hid = params[:helper_id]
    remove = params[:remove]
    m = Modifier.where(id: mid).first
    g = Geography.where(id: gid).first
    s = Space.where(id: sid).first
    h = Helper.where(id: hid).first

    if remove
      mi = ModifierInstance.where(id: params[:modifier_instance]).first
      h.modifier_instances.delete(mi)
    end

    if m.nil?
      flash[:error] = "Could not find modifier with ID #{mid}"
    else
      if h.nil?
        flash[:error] = "Could not find helper with ID #{hid}"
      else
        mi = ModifierInstance.find_or_create_by(modifier: m, geography: g, space: s)
        h.modifier_instances << mi
      end
    end

    @helper = h
    redirect_to edit_helper_path(h)
  end

  # POST /helpers
  # POST /helpers.json
  def create
    @helper = Helper.new(helper_params)

    respond_to do |format|
      if @helper.save
        format.html { redirect_to edit_helper_path(@helper), notice: 'Helper was successfully created.' }
        format.json { render :show, status: :created, location: @helper }
      else
        format.html { render :new }
        format.json { render json: @helper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /helpers/1
  # PATCH/PUT /helpers/1.json
  def update
    respond_to do |format|
      if @helper.update(helper_params)
        format.html { redirect_to edit_helper_path(@helper), notice: 'Helper was successfully updated.' }
        format.json { render :show, status: :ok, location: @helper }
      else
        format.html { render :edit }
        format.json { render json: @helper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /helpers/1
  # DELETE /helpers/1.json
  def destroy
    @helper.destroy
    respond_to do |format|
      format.html { redirect_to helpers_url, notice: 'Helper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_helper
      @helper = Helper.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def helper_params
      params.require(:helper).permit(:title, :text, :geography_id, :image)
    end
end
