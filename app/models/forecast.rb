class Forecast < ActiveRecord::Base
  belongs_to :location
  
  def current_time
    Time.zone = location.timezone
    Time.zone.now
  end
  
  def sunset
    Time.zone = location.timezone
    sunset_at.in_time_zone
  end

  def daylight_remaining
    Time.at(sunset - current_time).utc
  end
  
  def self.today
    weather = Weather.query('24060')
    Forecast.find_or_create_by_date(Date.today, 
      :sunset_at => weather.sunset,
      :location => build_location(weather.location))
  end
  
  private
    def self.build_location(options = {})
      Location.find_or_create_by_city_and_state(options)
    end
end
