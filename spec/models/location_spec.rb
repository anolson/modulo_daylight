require 'spec_helper'

describe "Location" do
  it "delagates validation" do
    location = Location.query('')
    location.should_not be_valid
    location.should have(1).errors_on(:query)
  end
    
  it "calulates the amount of daylight remaining" do
    location = Location.query('24060')
    location.daylight_remaining.should_not be_nil
  end
end