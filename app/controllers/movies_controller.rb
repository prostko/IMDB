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
  end

  def search

    @movies = get_movies_by_title(params['search_form'])

    if @movies
      render "movies/index"
    else
      @errors = 'Movie not found' # need to implement error message partials
      render 'movies/index'
    end
  end

end
