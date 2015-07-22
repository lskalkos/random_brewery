class BreweriesController < ApplicationController

  def index
    @brewery = Brewery.new
  end

  def create
    binding.pry
  end
  
end
