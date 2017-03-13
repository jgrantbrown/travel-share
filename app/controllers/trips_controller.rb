class TripsController < ApplicationController




  private

  def trip_params
    params.require(:trip).permit(:user_id, :city_id, :status)
  end
end
