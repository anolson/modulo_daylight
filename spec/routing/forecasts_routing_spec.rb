describe "routes for Forecasts" do
  it "routes /forecasts to the forecasts controller" do
    get("/forecasts").should route_to("forecasts#index")
    post("/forecasts/search").should route_to("forecasts#search")
  end

  it "routes / to the forecasts controller" do
    get("/").should route_to("forecasts#index")
  end
end