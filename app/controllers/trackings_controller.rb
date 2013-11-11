class TrackingsController < ApplicationController
  before_filter :authenticate_user!

  # GET /trackings
  # GET /trackings.json
  def index
    @trackings = Tracking.all

    render json: @trackings
  end

  # GET /trackings/1
  # GET /trackings/1.json
  def show
    @tracking = Tracking.find(params[:id])

    render json: @tracking
  end

  # POST /trackings
  # POST /trackings.json
  def create
  end

  # PATCH/PUT /trackings/1
  # PATCH/PUT /trackings/1.json
  def update
    @tracking = Tracking.find(params[:id])

    if @tracking.update(params[:tracking])
      head :no_content
    else
      render json: @tracking.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trackings/1
  # DELETE /trackings/1.json
  def destroy
    @tracking = Tracking.find(params[:id])
    @tracking.destroy

    head :no_content
  end
end
