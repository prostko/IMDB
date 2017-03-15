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
    if request.xhr?
      @movies = get_movies_by_title(params["searchResult"])
    else
      @movies = get_movies_by_title(params['search_form'])
    end

    if @movies
      @movies.map! do |movie|
        movie = Movie.find_by(imdbID: movie.imdbID)
      end
    end


    if @movies && !request.xhr?
      activity_logger('search', params['search_form'])
      render "movies/index"
    elsif request.xhr?
      render :json => @movies
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

  def delete_from_watchlist
    movie = Movie.find_by(id: params[:id])
    @entry = Watchlist.where(movie_id: movie.id, user_id: current_user.id)

    @entry.first.destroy
    redirect_to "/users/#{current_user.id}"
  end

  private
  def find_movie(id)
    Movie.find_by(id: id)
  end
end
