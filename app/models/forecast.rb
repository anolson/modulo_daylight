class Forecast < ActiveRecord::Base
  after_create :cache_forecast
  belongs_to :location
  
  def cache_forecast()
    unless cached?
      weather = Weather.query(location.query_string)
      update_attributes(:sunset_in_seconds => weather.sunset_in_seconds, :cached => true)
    end
  end
  
  def current_time
    Time.now.in_time_zone(location.timezone)
  end
  
  def sunset
    Time.zone = location.timezone 
    Time.zone.local(date.year, date.month, date.day, time_of_sunset.hour, time_of_sunset.min)
  end

  def daylight_remaining
    Time.at(sunset - current_time).utc
  end
  
  private
    def time_of_sunset
      @time_of_sunset ||= Time.at(sunset_in_seconds).utc
    end
end
