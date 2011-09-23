class Forecast < ActiveRecord::Base
  after_create :cache_forecast
  belongs_to :location

  def cache_forecast()
    unless cached?
      weather = Weather.query(location.query_string)
      update_attributes(:cached => true, :sunset_in_seconds => weather.sunset_in_seconds)
    end
    update_attributes(:date => today)
  end
  
  def sunset
    localize_time Time.local(date.year, date.month, date.day, time_of_sunset.hour, time_of_sunset.min, time_of_sunset.sec)
  end

  def daylight_remaining
    return Time.at(0).utc if after_sunset?
    
    Time.at(daylight_delta.abs).utc
  end

  def before_sunset?
    daylight_delta > 0
  end

  def after_sunset?
    daylight_delta < 0
  end

  def today?
    date == today
  end

  private
    def localize_time(time)
      time.in_time_zone(location.timezone)
    end

    def current_time
      localize_time Time.now
    end

    def today
      current_time.to_date
    end

    def daylight_delta
      @daylight_delta ||= sunset - current_time
    end

    def time_of_sunset
      @time_of_sunset ||= Time.at(sunset_in_seconds).utc
    end
end