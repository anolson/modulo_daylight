class ForecastsController < ApplicationController
  def index
    @forecast = Forecast.new
  end
  
  def search
    @forecast = Forecast.query(params[:query])
  end
  
  def today
    @forecast = Forecast.today
  end
end
