class Locations::ForecastsController < ApplicationController
  def show
    location = Location.find_or_create_by_state_and_city(:state => params[:state], :city => params[:city])
    @forecast = location.forecast_for_today
  end
end
