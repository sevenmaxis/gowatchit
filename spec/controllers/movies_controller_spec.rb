require 'spec_helper'

describe MoviesController do

  describe "GET index" do
    it "calls Movie model with query" do
      query = "The Great Gatsby"
      Movie.should_receive(:search).with(query)
      get :index, {:query => query}
    end
  end

  describe "GET show" do
    it "call Movie model with params" do
      imdb = "tt0071577"
      title = "The Great Gatsby"
      year = "1974"
      Movie.should_receive(:find).with(imdb, title, year)
      get :show, {id: imdb, title: title, year: year}
    end
  end
end