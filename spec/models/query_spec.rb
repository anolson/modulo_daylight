require 'spec_helper'

describe Query do
  it "queries a location" do
    location = Query.query_location('24060')
    location.city.should == 'blacksburg'
    location.state.should == 'va'    
  end
  
  it "requires a valid query term" do
    lambda { location = Query.query_location(nil) }.should raise_error
    lambda { location = Query.query_location('') }.should raise_error
  end
end