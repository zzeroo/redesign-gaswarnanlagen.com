class BdasController < ApplicationController
  before_action :set_bda, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :create, :update, :destroy]

  # GET /bdas
  # GET /bdas.json
  def index
    @bdas = Bda.all
  end

  # GET /bdas/1
  # GET /bdas/1.json
  def show
  end

  # GET /bdas/new
  def new
    @bda = Bda.new
  end

  # GET /bdas/1/edit
  def edit
  end

  # POST /bdas
  # POST /bdas.json
  def create
    @bda = Bda.new(bda_params)

    respond_to do |format|
      if @bda.save
        format.html { redirect_to @bda, success: 'BDA erfolgreich erstellt.' }
        format.json { render action: 'show', status: :created, location: @bda }
      else
        format.html { render action: 'new' }
        format.json { render json: @bda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bdas/1
  # PATCH/PUT /bdas/1.json
  def update
    respond_to do |format|
      if @bda.update(bda_params)
        format.html { redirect_to @bda, notice: 'Bda was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bdas/1
  # DELETE /bdas/1.json
  def destroy
    @bda.destroy
    respond_to do |format|
      format.html { redirect_to bdas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bda
      @bda = Bda.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bda_params
      params.require(:bda).permit(:name, :description, :product_nr_prefix)
    end
end
