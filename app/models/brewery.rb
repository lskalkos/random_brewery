class Brewery < ActiveRestClient::Base
  base_url "http://api.brewerydb.com/v2/"
  # before_request do |name, request|
  #   request.headers["HTTP_ACCEPT"] = "application/json"
  # end

  get :all, '/search/geo/point?lat=:lat&lng=:lng&key=dd604aa40606566d3f9fcba2c8ff7d8c'

  def self.random(latitude, longitude)
    all(lat: latitude, lng: longitude).data.take(1).first
  end

  # def beers
  #   Beer.all(self.id)
  # end

end