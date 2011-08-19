require 'spec_helper'

describe "Weather" do
  it "requires a valid query" do
    weather = Weather.new
    weather.should_not be_valid
    weather.should have(1).errors_on(:query)

    weather = Weather.new('')
    weather.should_not be_valid
    weather.should have(1).errors_on(:query)
  end
  
  it "calculates the time of today's sunset" do
    weather = Weather.new(:query => '24060')
    weather.sunset.should_not be_nil
  end
  
  it "calculates the current time" do
    weather = Weather.new(:query => '24060')
    weather.current_time_at.should_not be_nil
  end
  
end