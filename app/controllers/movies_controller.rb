class MoviesController < ApplicationController
  
  respond_to :html

  def index
    @query = params[:query] || "The Great Gatsby"
    @movies = Movie.search(@query)
    respond_with @movies
  end

  def show
    @movie = Movie.find(params[:id], params[:title], params[:year])
    respond_with @movie
  end
end
