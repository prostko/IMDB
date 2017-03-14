class MoviesController < ApplicationController
  include ApplicationHelper

  def index
    render 'index'
  end


  def show
    @movie = find_movie(params[:id])
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
    require_user

    @movie = find_movie(params[:id])
    @movie.likes.create(user_id: session[:user_id])

    redirect_to :back
  end

  private
  def find_movie(id)
    Movie.find_by(id: id)
  end
end
