require 'base'

class Weather < Model
  
  attr_accessor :query
  
  def self.query(query)
    self.new(:query => query)
  end
  
  def sunset
    current.sun.set.to_t.utc
  end

  def location
    {:state => state, :city => city, :timezone => timezone}
  end
  
  private
    def city
      measurement.location.city
    end

    def state
      measurement.location.state_name
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