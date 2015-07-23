class Brewery < ActiveRestClient::Base
  base_url "http://api.brewerydb.com/v2/"
  # before_request do |name, request|
  #   request.headers["HTTP_ACCEPT"] = "application/json"
  # end

  get :all, '/search/geo/point?lat=:latitude&lng=:longitude&key=dd604aa40606566d3f9fcba2c8ff7d8c'

  def self.random(location_hash)
    local_breweries = all(location_hash)
    random_index_number = rand(local_breweries.totalResults)
    local_breweries.data[random_index_number]
  end

  def name
    self.brewery["name"]
  end

  def test_function
    "Hi this is now Lia"
  end

  def name
    
    self.brewery["name"]
  end

  def beers
    Beer.all(brewery_id: self.brewery.id).data
  end

  def random_beer
    brewery_beers = beers
    if !brewery_beers.nil?
      random_index_number = rand(brewery_beers.count)
      brewery_beers[random_index_number]
    else
      Beer.new
    end
  end



end