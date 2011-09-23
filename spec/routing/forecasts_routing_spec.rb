require 'spec_helper'

describe "routes for Forecasts" do
  it "routes /locations to the locations controller" do
    get("/locations").should route_to("locations#index")
    post("/locations/search").should route_to("locations#search")
  end

  it "routes / to the locations controller" do
    get("/").should route_to("locations#index")
  end
end