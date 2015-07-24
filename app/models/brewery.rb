class Brewery < ActiveRestClient::Base
  base_url "http://api.brewerydb.com/v2/"

  get :all, '/search/geo/point?lat=:latitude&lng=:longitude&key=dd604aa40606566d3f9fcba2c8ff7d8c'

  def self.random(location_hash)
    local_breweries = all(location_hash).data
    sample(local_breweries)
  end

  def name
    self.brewery["name"]
  end

  def beers
    Beer.all(brewery_id: self.brewery.id).data
  end

  def random_beer
    Beer.sample(beers)
  end

  def self.sample(breweries)
    breweries[rand(breweries.count)]
  end




end