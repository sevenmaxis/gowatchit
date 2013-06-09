class MoviesController < ApplicationController
  
  respond_to :html

  def show
    respond_with Movie.find(params[:imdb], params[:title], params[:year])
  end

  def search
    respond_with Movie.search(params[:query])
  end
end
