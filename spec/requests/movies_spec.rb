require 'spec_helper'

describe "Movies requests", vcr: {cassette_name: 'Movie#requests'} do

  before(:each) do
    visit "/"
  end

  it "initial page should have submit button" do
    page.should have_css('input[name="commit"]')
  end

  it "should have right content" do
    fill_in 'query', :with => "The Great Gatsby"
    within("#content") do
      click_button "search"
    end
    page.should have_content("Found 4 items")
    page.should have_content("The Great Gatsby 2013")
    page.should have_content("The Great Gatsby 1974")
  end
end