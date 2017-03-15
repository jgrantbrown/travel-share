class TripsController < ApplicationController

  def index
    @trips = Trip.all
    @cities = City.all
  end

  def new
    @trip = Trip.new
  end

  def create
    byebug
    @user = User.find(params[:user_id])
  end

  def edit
    @user = User.find(params[:user_id])
    @cities = City.all
  end

  def update
    byebug
    @user = User.find(params[:user_id])
    byebug
  end

  def destroy

  end


  private

  def trip_params
    params.require(:trip).permit(:user_id, :city_id, :status)
  end
end
