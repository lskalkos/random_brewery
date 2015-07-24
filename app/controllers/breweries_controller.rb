class BreweriesController < ApplicationController

  def index
    @brewery = Brewery.new
    @latitude = get_location["latitude"]
    @longitude = get_location["longitude"]
  end

  def create
    @brewery = Brewery.random(brewery_params)
    @chosen_beer = @brewery.random_beer

    respond_to do |format|
      format.js
    end

  end


  private

  def brewery_params
    params.require(:brewery).permit(:latitude, :longitude)
  end
  
end
