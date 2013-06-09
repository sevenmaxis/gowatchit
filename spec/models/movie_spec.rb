require 'spec_helper'

describe Movie do

  describe "#search", vcr: {cassette_name: 'Movie#search'} do

    it "returns" do
      movies = Movie.search("The Great Gatsby")

      movies.size.should == 4
      movies.first[:original_name].should == "The Great Gatsby"
      movies.first[:released].should == "2013-05-10"
      movies.first[:overview].should =~ /^An adaptation of F. Scott/
    end
  end

  describe "#find" do


  end
end