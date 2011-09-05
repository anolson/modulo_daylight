require 'spec_helper'

describe "forecasts/index.html.erb" do
  it "displays a search form" do
    assign(:forecast, Forecast.new)

    render
    
    rendered.should have_selector("form[action='/forecasts/search'][method='post']")
    rendered.should have_field("query")
    rendered.should have_selector("input[type='submit']")
  end
end