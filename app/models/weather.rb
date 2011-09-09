require 'base'

class Weather < Model
  
  attr_accessor :query
  
  def self.query(query)
    self.new(:query => query)
  end
  
  def sunset_in_seconds
    current.sun.set.total_seconds
  end

  def location
    {:state => state, :city => city, :timezone => timezone}
  end
  
  private
    def city
      measurement.location.city.downcase
    end

    def state
      measurement.location.state_code.downcase
    end

    def timezone
      measurement.timezone.zone_full
    end
  
    def measurement
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