require 'barometer'
require 'base'

class Weather < Model

  attr_accessor :query
  validates_presence_of :query
 
  def sunset
    measurements.current.sun.set
  end

  def current_time_at
    measurements.current.current_at
  end
  
  private
    def measurements
       @measurements ||= Barometer.new(@query).measure
    end
end