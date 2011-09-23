require 'spec_helper'

describe "Weather" do
  it "provides the time in seconds of today's sunset" do
    weather = Weather.query('24060')
    weather.sunset_in_seconds.should_not be_nil
  end
  
  it "provides location information for a weather query" do
    weather = Weather.query('24060')
    weather.location.should_not be_nil
    weather.location[:city].should == 'blacksburg'
    weather.location[:state].should == 'va'
    weather.location[:timezone].should == 'America/New_York'
  end
end