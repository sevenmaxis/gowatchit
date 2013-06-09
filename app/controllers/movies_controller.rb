class MoviesController < ApplicationController
  
  respond_to :html

  def index
    @movies = Movie.search(params[:query])
    respond_with @movies
  end

  def show
    @movie = Movie.find(params[:id], params[:title], params[:year])
    respond_with @movie
  end
end
