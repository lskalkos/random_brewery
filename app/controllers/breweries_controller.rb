class BreweriesController < ApplicationController

  def index
  end

  def create
    binding.pry
  end


  private

  def brewery_params
    params.require(:brewery).permit(:latitude, :longitude)
  end
  
end
