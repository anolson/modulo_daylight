require 'spec_helper'

describe ForecastsHelper do
  it "formats a time with hours and minutes" do
    time = Time.at(1316807987)
    format_time(time).lstrip.should == "3:59"
  end

  it "formats a time with just minutes" do
    time = Time.at(1200).utc
    format_time(time).lstrip.should == "0:20"
  end
end