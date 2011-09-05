require 'spec_helper'

describe ForecastsController do
  describe "GET index" do
    it "assigns @forecast" do
      get :index
      assigns(:forecast).should be_a_new(Forecast)
    end
    
    it "renders the index template" do
      get :index
      response.should render_template("index")
    end
  end
  
  describe "POST search" do
    it "assigns @forecasts" do
      post :search, :query => '24060'
      assigns(:forecast).location_name.should == "Blacksburg, VA"
    end
    
    # it "renders the index template" do
    #   get :index
    #   response.should render_template("index")
    # end
  end
end
