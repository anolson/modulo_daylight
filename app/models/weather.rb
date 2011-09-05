require 'barometer'
require 'base'

class Weather < Model

  attr_accessor :query
  validates_presence_of :query
 
  def sunset
    current.sun.set
  end

  def current_time_at
    current.current_at
  end
  
  def daylight_remaining
    sunset - current_time_at
  end
  
  def location
    measurements.location
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