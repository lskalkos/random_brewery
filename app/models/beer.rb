class Beer < ActiveRestClient::Base
  base_url "http://api.brewerydb.com/v2/"

  get :all, '/brewery/:brewery_id/beers?key=dd604aa40606566d3f9fcba2c8ff7d8c'

  def self.sample(beers)
    beers.nil? ? Beer.new : beers[rand(beers.count)]
  end

end