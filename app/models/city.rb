
class City < ApplicationRecord
  has_many :trips
  has_many :users, through: :trips


  def google_api_fetch
    google_url = "https://maps.googleapis.com/maps/api/geocode/json?address="
    key = "AIzaSyBX0uhYUckiNoXfuIesdb-mto1elMAGPT4"
    @city_data =  JSON.parse(RestClient.get(google_url + self.name + "&" + key))
end

  def gather_api_city_data
    google_api_fetch
    address = @city_data["results"][0]["address_components"][0]
      if self.name = address["long_name"]
        self.latitude = @city_data["results"][0]["geometry"]["location"]["lat"]
        self.longitude = @city_data["results"][0]["geometry"]["location"]["lng"]
      end
    end


end
