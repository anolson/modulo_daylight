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
    it "assigns @locations" do
      post :search, :location => {:query => '24060'}
      assigns(:location).name.should == "Blacksburg, VA"
    end
    
    # it "renders the index template" do
    #   get :index
    #   response.should render_template("index")
    # end
  end
end
