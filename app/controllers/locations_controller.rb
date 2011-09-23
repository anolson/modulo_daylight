class LocationsController < ApplicationController
  def index
    @location = Location.new
  end
  
  def search
    location = Query.query_location(params[:query])
    redirect_to location_forecast_path(location.underscore_city_and_state)
  end
end
