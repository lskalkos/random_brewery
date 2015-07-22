class Brewery < ActiveRestClient::Base
  base_url "http://api.brewerydb.com/v2/"
  # before_request do |name, request|
  #   request.headers["HTTP_ACCEPT"] = "application/json"
  # end

  get :all, '/search/geo/point?lat=:lat&lng=:lng&key=dd604aa40606566d3f9fcba2c8ff7d8c'

  def self.random(latitude, longitude)
    local_breweries = all(lat: latitude, lng: longitude)
    random_index_number = rand(local_breweries.totalResults)
    local_breweries.data[random_index_number]
  end

  def test_function
    "Hi this is now Lia"
  end

  # def beers
  #   Beer.all(self.id)
  # end

end