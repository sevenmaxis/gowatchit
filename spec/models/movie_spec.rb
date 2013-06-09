require 'spec_helper'

describe Movie do

  describe "#search", vcr: {cassette_name: 'Movie#search'} do

    it "returns collection of movies" do
      movies = Movie.search("The Great Gatsby")

      movies.size.should == 4
      movies.first[:original_name].should == "The Great Gatsby"
      movies.first[:released].should == "2013-05-10"
      movies.first[:overview].should =~ /^An adaptation of F. Scott/
    end
  end

  describe "#find", vcr: {cassette_name: 'Movie#find'}  do

    it "returns movie" do
      movie = Movie.find("tt0071577", "The Great Gatsby", 1974)
      
      movie[:original_name].should == "The Great Gatsby"
      movie[:released].should == "1974-03-27"
      movie[:href].should == "/store/movies/details/The_Great_Gatsby_1974?id=P5GQTdU1358&feature=search_result"
      movie[:price].should == "From $2.99"
    end
  end
end