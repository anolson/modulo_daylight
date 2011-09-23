require 'spec_helper'

describe LocationsController do
  describe "GET index" do
    it "assigns @location" do
      get :index
      assigns(:location).should be_a_new(Location)
    end
    
    it "renders the index template" do
      get :index
      response.should render_template("index")
    end
  end
  
  describe "POST search" do
    it "redirects to forecast" do
      post :search, :query => '24060'
      should redirect_to(location_forecast_path(:city => 'blacksburg', :state => 'va'))
    end
  end
end
