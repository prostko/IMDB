class MoviesController < ApplicationController
  include ApplicationHelper

  def index
    render 'index'
  end


  def show
    @movie = Movie.find_by(id: params[:id])
    @comments = @movie.comments
    @conversation = Conversation.new
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

  def destroy_like
    @movie = Movie.find(params[:id])
    @like = Like.where(movie_id: @movie.id, user_id: session[:user_id])
    @like.first.destroy
    redirect_to :back
  end

  def watchlist
    require_user
    @movie = find_movie(params[:id])
    watchlist = @movie.watchlists.create(user_id: session[:user_id], movie_id: params[:movie_id])

    activity_logger('watchlist', @movie) if watchlist.valid?
    redirect_to :back
  end

  private
  def find_movie(id)
    Movie.find_by(id: id)
  end
end
