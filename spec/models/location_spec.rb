require 'spec_helper'

describe Location do
  it "find or create a location by city and state" do
    location = Location.find_or_create_by_city_and_state(:city => 'San Francisco', :state => 'CA')
    
    location.cached.should be true
    location.city.should == 'san francisco'
    location.state.should == 'ca'
    location.name.should == 'San Francisco, CA'
  end
  
end