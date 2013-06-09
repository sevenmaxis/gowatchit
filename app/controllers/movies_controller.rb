class MoviesController < ApplicationController
  
  respond_to :html

  def index
    puts "="*50
    @query = params[:query]
    @movies = @query ? Movie.search(@query) : nil
    respond_with @movies
  end

  def show
    puts "/"*50
    @movie = Movie.find(params[:id], params[:title], params[:year])
    respond_with @movie
  end
end
