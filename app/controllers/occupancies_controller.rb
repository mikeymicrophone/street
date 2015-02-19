class OccupanciesController < ApplicationController
  before_action :set_occupancy, only: [:show, :edit, :update, :destroy]

  # GET /occupancies
  # GET /occupancies.json
  def index
    @occupancies = Occupancy.all
  end

  # GET /occupancies/1
  # GET /occupancies/1.json
  def show
  end

  # GET /occupancies/new
  def new
    @occupancy = Occupancy.new
  end

  # GET /occupancies/1/edit
  def edit
  end

  # POST /occupancies
  # POST /occupancies.json
  def create
    @occupancy = Occupancy.new(occupancy_params)

    respond_to do |format|
      if @occupancy.save
        format.html { redirect_to @occupancy, notice: 'Occupancy was successfully created.' }
        format.json { render :show, status: :created, location: @occupancy }
      else
        format.html { render :new }
        format.json { render json: @occupancy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /occupancies/1
  # PATCH/PUT /occupancies/1.json
  def update
    respond_to do |format|
      if @occupancy.update(occupancy_params)
        format.html { redirect_to @occupancy, notice: 'Occupancy was successfully updated.' }
        format.json { render :show, status: :ok, location: @occupancy }
      else
        format.html { render :edit }
        format.json { render json: @occupancy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /occupancies/1
  # DELETE /occupancies/1.json
  def destroy
    @occupancy.destroy
    respond_to do |format|
      format.html { redirect_to occupancies_url, notice: 'Occupancy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_occupancy
      @occupancy = Occupancy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def occupancy_params
      params.require(:occupancy).permit(:unit_id, :resident_id)
    end
end
