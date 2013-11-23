class TrackingsController < ApplicationController
  before_filter :authenticate_user!

  # GET /trackings
  # GET /trackings.json
  def index
    trackings = Tracking.find_all_by_user_id(current_user)

    render json: trackings
  end

  # GET /trackings/1
  # GET /trackings/1.json
  def show
    tracking = Tracking.find_by_id(params[:id])

    return render json: {}, status: 404 unless tracking
    return render json: {}, status: 403 if tracking.user != current_user

    render json: tracking , status: 200
  end

  # POST /trackings
  # POST /trackings.json
  def create
    tracking_params = params.require(:tracking).permit(:start, :stop, :description)

    tracking = Tracking.create(tracking_params)
    tracking.user = current_user
    if tracking.save
      render json: { id: tracking.id }, status: 201
    else
      render json: {}, status: 400
    end
  end

  # PATCH/PUT /trackings/1
  # PATCH/PUT /trackings/1.json
  def update
    tracking_params = params.require(:tracking).permit(:start, :stop, :description)

    tracking = Tracking.find_by_id(params[:id])
    return render json: {}, status: 404 unless tracking

    return render json: {}, status: 403 if tracking.user != current_user

    if tracking.update(tracking_params[:tracking])
      head :no_content # 204
    else
      render json: tracking.errors, status: 422 # Unprocessable Entity
    end
  end

  # DELETE /trackings/1
  # DELETE /trackings/1.json
  def destroy
    tracking = Tracking.find_by_id(params[:id])

    return render json: {}, status: 403 if tracking.user != current_user

    if tracking.destroy
      head :no_content # 204
    else
      render json: tracking.errors, status: 422 # Unprocessable Entity
    end
  end
end
