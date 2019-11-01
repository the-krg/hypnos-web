class NightsController < ApplicationController
  before_action :set_night, only: [:show, :edit, :update, :destroy]

  # GET /nights
  # GET /nights.json
  def index
    @nights = Night.all
  end

  # GET /nights/1
  # GET /nights/1.json
  def show
  end

  # GET /nights/new
  def new
    @night = Night.new
  end

  # GET /nights/1/edit
  def edit
  end

  # POST /nights
  # POST /nights.json
  def create
    @night = Night.new(night_params)
    @night.user = current_user

    respond_to do |format|
      if @night.save
        format.html { redirect_to root_path, notice: 'Sua noite foi registrada!' }
        format.json { render :show, status: :created, location: root_path }
      else
        format.html { render :new }
        format.json { render json: @night.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nights/1
  # PATCH/PUT /nights/1.json
  def update
    respond_to do |format|
      if @night.update(night_params)
        format.html { redirect_to @night, notice: 'Night was successfully updated.' }
        format.json { render :show, status: :ok, location: @night }
      else
        format.html { render :edit }
        format.json { render json: @night.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nights/1
  # DELETE /nights/1.json
  def destroy
    @night.destroy
    respond_to do |format|
      format.html { redirect_to nights_url, notice: 'Night was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_night
      @night = Night.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def night_params
      params.fetch(:night).permit(:quality, :sleep_hour, :wake_hour, :dream, :description, :ill)
    end
end
