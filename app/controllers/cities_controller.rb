class CitiesController < ApplicationController
  before_action :require_login

  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
    @city_data = @city.gather_api_city_data

  end

  private

  def city_params
    params.require(:city).permit(:name, :latitude, :longtitude, :country, :description)
  end

end
