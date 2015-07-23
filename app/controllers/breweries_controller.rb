class BreweriesController < ApplicationController

  def index
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
