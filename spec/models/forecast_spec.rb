require 'spec_helper'

describe "Forecast" do
  it "requires a valid query" do
    forecast = Forecast.query(nil)
    forecast.should_not be_valid
    forecast.should have(1).errors_on(:query)

    forecast = Forecast.query('')
    forecast.should_not be_valid
    forecast.should have(1).errors_on(:query)
  end
  
  it "calculates the time of today's sunset" do
    forecast = Forecast.query('24060')
    forecast.sunset.should_not be_nil
  end
  
  it "calculates the current time" do
    forecast = Forecast.query('24060')
    forecast.current_time_at.should_not be_nil
  end
  
  it "calulates the amount of daylight remaining today" do
    location = Forecast.query('24060')
    location.daylight_remaining.should_not be_nil
  end
end