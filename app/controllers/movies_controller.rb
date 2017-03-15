class MoviesController < ApplicationController
  include ApplicationHelper

  def index
    render 'index'
  end


  def show

    #user response will be passed into the helper method created to get data from the API. A helper method will pull the necessary data regarding comments on the particular movie or show in question. The return result
    # @response =

    #commented out the render show. Rails knows to look for the show page in the movies views.
    # render 'show'
    @movie = Movie.find_by(id: params[:id])
    @comments = @movie.comments
    activity_logger('movie', @movie) if @movie
    @comment = Comment.new
    @related_movies = @movie.related_movies

  end

  def search
    @movies = get_movies_by_title(params['search_form'])

    if @movies
      @movies.map! do |movie|
        movie = Movie.find_by(imdbID: movie.imdbID)
      end
    end

    if @movies
      activity_logger('search', params['search_form'])
      render "movies/index"
    else
      @errors = 'Movie not found' # need to implement error message partials
      render 'movies/index'
    end
  end

  def like
    require_user
    @movie = find_movie(params[:id])
    like = @movie.likes.create(user_id: session[:user_id])

    activity_logger('like', @movie) if like.valid?
    redirect_to :back
  end

  def watchlist
    require_user
    @movie = find_movie(params[:id])
    watchlist = @movie.watchlists.create(user_id: session[:user_id], movie_id: params[:movie_id])
binding.pry
    activity_logger('watchlist', @movie) if watchlist.valid?
    redirect_to :back
  end

  private
  def find_movie(id)
    Movie.find_by(id: id)
  end
end
