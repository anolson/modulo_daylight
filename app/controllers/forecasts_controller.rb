class ForecastsController < ApplicationController
  def index
    @forecast = Forecast.new
  end
  
  def search
    location = Query.query_location(params[:query])
    redirect_to locations_forecast_path(:state => location.state, :city => location.city)    
  end
end
