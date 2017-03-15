class CommentsController < ApplicationController
  include ApplicationHelper

  def new
    @comment = Post.new(user_id: current_user.id, movie_id: params[:user_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @movie = @comment.movie
    @comments = @movie.comments
    if @comment.save
      activity_logger('comment', @movie)
      redirect_to movie_path(@movie)
    else
      render 'movies/show'
    end
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @movie =@comment.movie
    @comment.destroy
    redirect_to movie_path(@movie)
  end

  def show
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :movie_id, :user_id)
  end

end
