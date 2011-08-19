require 'spec_helper'

describe "locations/index.html.erb" do
  it "displays a search form" do
    assign(:location, Location.new)

    render
    
    rendered.should have_selector("form[action='/locations'][method='post']")
    rendered.should have_field("query")
    rendered.should have_selector("input[type='submit']")
  end
end