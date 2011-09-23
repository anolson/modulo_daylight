require 'spec_helper'

describe Forecast do
  before(:each) do
    @location = Location.new(:city => 'blacksburg', :state => 'va', :timezone => 'America/New_York')
  end
  
  it "calculates the amount of daylight remaining today" do
    forecast = Forecast.create(:location => @location, :sunset_in_seconds => 69600, :cached => true)
  
    forecast.sunset.should_not be_nil
    forecast.daylight_remaining.should_not be_nil
  end
  
  it "determines if the forecast occurs today" do
    forecast = Forecast.create(:location => @location, :cached => true)
    forecast.today?.should be true
    
    forecast.date = "01/01/2011"
    forecast.today?.should be false
  end
  
  
  it "caches weather data for a location" do
    forecast = Forecast.create(:location => @location)

    forecast.cached?.should be true
    forecast.today?.should be true
    forecast.sunset.should_not be_nil
    forecast.daylight_remaining.should_not be_nil
  end
  
end