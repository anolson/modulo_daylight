class LocationsController < ApplicationController

  def index
    @location = Location.new
  end
  
  def search
    @location = Location.query(params[:query])
  end
end
