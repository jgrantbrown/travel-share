class CitiesController < ApplicationController


  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
    @city_data = @city.gather_api_city_data
    @photos = @city.gather_api_photo_data
  end

  private

  def city_params
    params.require(:city).permit(:name, :latitude, :longtitude, :country, :description)
  end

end

# def create
#   city = City.new(city_params)
#
#   @city = city
#   redirect_to city_path(@city)
# end
#
