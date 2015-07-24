class Beer < ActiveRestClient::Base
  base_url "http://api.brewerydb.com/v2/"

 

  

  get :all, '/brewery/:brewery_id/beers?key=' + ENV["api_key"]


  def self.sample(beers)
    beers.nil? ? Beer.new : beers[rand(beers.count)]
  end

end


