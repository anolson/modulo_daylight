require 'base'

class Location < Model
    
  attr_accessor :weather
    
  def initialize(attributes = {})
    super(attributes)
  end
    
  def daylight_remaining
    @weather.sunset - @weather.current_time_at
  end
  
  def self.query(query)
    Location.new(:weather => Weather.new(:query => query))
  end
  
  def valid?
    super() && @weather.valid?
  end
  
  def errors
    @weather.errors
  end
end
