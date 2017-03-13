class MoviesController < ApplicationController
  def index
    render 'index'
  end


  def show
    #user response will be passed into the helper method created to get data from the API. A helper method will pull the necessary data regarding comments on the particular movie or show in question. The return result
    # @response =

    #commented out the render show. Rails knows to look for the show page in the movies views. 
    # render 'show'
  end
end
