require 'spec_helper'

describe ForecastsHelper do
  it "formats a time with hours and minutes" do
    time = Time.mktime(2011, 9, 23, 2, 30)
    format_time(time).lstrip.should == "2:30"
  end

  it "formats a time with just minutes" do
    time = Time.mktime(2011, 9, 23, 0, 20)
    format_time(time).lstrip.should == "0:20"
  end
  
  it "formats and rounds a time with hours and minutes" do
    time = Time.mktime(2011, 9, 23, 2, 33, 45)
    format_time(time).lstrip.should == "2:34"
  end
end