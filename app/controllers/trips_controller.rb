class TripsController < ApplicationController

  def new
    @trip = Trip.new
  end

  def create

  end

  def update

  end

  private

  def trip_params
    params.require(:trip).permit(:user_id, :city_id, :status)
  end
end
