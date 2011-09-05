require 'barometer'
require 'base'

class Forecast < Model

  attr_accessor :query
  validates_presence_of :query
 
  def self.query(query)
    self.new(:query => query)
  end
 
  def sunset
    current.sun.set.to_t
  end

  def current_time
    current.current_at.to_t
  end
  
  def daylight_remaining
    Time.at(sunset - current_time).utc
  end
  
  def location_name
    measurements.location.name
  end
  
  private
    def measurements
       weather.measurements.first
    end
    
    def current
       weather.current
    end

    def weather
       @weather ||= barometer.measure
    end
        
    def barometer
      Barometer.new(@query)
    end
end