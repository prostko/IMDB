class WatchlistsController < ApplicationController
  # def new
  #   @watchlist_entry = WatchList.new
  # end

  def create
    # params.inspect
    @watchlist_entry = Watchlist.new(user_id: params[:user_id], imdbID: params[:imdbID], movie_title: params[:movie_title])

    if @watchlist_entry.save
      redirect_to :back
    else
      @errors = ["You already added this movie to your like list"]
      redirect_to :back
    end
  end
end
