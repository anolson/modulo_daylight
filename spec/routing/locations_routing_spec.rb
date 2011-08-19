describe "routes for Locations" do
  it "routes /locations to the locations controller" do
    get("/locations").should route_to("locations#index")
  end
end