require 'spec_helper'
require Rails.root.join("lib/google_play")

describe GooglePlay do

  describe "search", vcr: {cassette_name: 'GooglePlay'} do

    before(:all) { WebMock.allow_net_connect! }

    it "returns link to movie and its price" do
      result = GooglePlay.search("The Great Gatsby (1974)")
      result[:href].should == "/store/movies/details/The_Great_Gatsby_1974?id=P5GQTdU1358&feature=search_result"
      result[:price].should == "From $2.99"
    end
  end
end