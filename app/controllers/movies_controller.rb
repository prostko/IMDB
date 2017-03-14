class MoviesController < ApplicationController
  include ApplicationHelper

  def index
    render 'index'
  end


  def show
    @movie = Movie.find_by(id: params[:id])
  end

  def search
    @movies = get_movies_by_title(params['search_form'])

    @movies.map! do |movie|
      movie = Movie.find_by(imdbID: movie.imdbID)
    end

    if @movies
      render "movies/index"
    else
      @errors = 'Movie not found' # need to implement error message partials
      render 'movies/index'
    end
  end

  def like

  end

end
