class ForecastsController < ApplicationController
  before_filter :find_location

  respond_to :html, :json, :js

  def show
    respond_with(@forecast = @location.forecast_for_today)
  end
  
  private 
    def find_location
      @location = Location.find_or_create_by_state_and_city(:state => params[:state], :city => params[:city])
    end
end
