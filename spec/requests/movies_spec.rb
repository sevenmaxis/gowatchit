require 'spec_helper'

describe "Movies requests" do

  before(:each) do
    visit "/"
  end

  it "initial page should have submit button" do
    page.should have_content("Search")
  end

  it "" do
    fill_in 'input[name="search"]', :with => "The Great Gatsby"
    click_on "Search"
    page.should have_content("The Great Gatsby")
  end
end