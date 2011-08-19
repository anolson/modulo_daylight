class LocationsController < ApplicationController

  def index
    @location = Location.new
  end
end
