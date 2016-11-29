class BackbarsController < ApplicationController
  before_action :set_backbar, only: [:show, :edit, :update, :destroy]

  # GET /backbars
  # GET /backbars.json
  def index
    @backbars = Backbar.all
  end

  # GET /backbars/1
  # GET /backbars/1.json
  def show
  end

  # GET /backbars/new
  def new
    @backbar = Backbar.new
  end

  # GET /backbars/1/edit
  def edit
  end

  # POST /backbars
  # POST /backbars.json
  def create
    @backbar = Backbar.new(backbar_params)

    respond_to do |format|
      if @backbar.save
        format.html { redirect_to @backbar, notice: 'Backbar was successfully created.' }
        format.json { render :show, status: :created, location: @backbar }
      else
        format.html { render :new }
        format.json { render json: @backbar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backbars/1
  # PATCH/PUT /backbars/1.json
  def update
    respond_to do |format|
      if @backbar.update(backbar_params)
        format.html { redirect_to @backbar, notice: 'Backbar was successfully updated.' }
        format.json { render :show, status: :ok, location: @backbar }
      else
        format.html { render :edit }
        format.json { render json: @backbar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backbars/1
  # DELETE /backbars/1.json
  def destroy
    @backbar.destroy
    respond_to do |format|
      format.html { redirect_to backbars_url, notice: 'Backbar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backbar
      @backbar = Backbar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backbar_params
      params.require(:backbar).permit(:venue_id, :product_id, :price)
    end
end
