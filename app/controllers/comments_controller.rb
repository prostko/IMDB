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
      @errors = ["Comment cannot be empty"]
      render 'movies/show'
    end
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
    @movie =@comment.movie
    @comments = @movie.comments
    @conversation = Conversation.new
    render 'movies/show'
  end

  def update
    @comment = Comment.find(params[:id])
    @movie =@comment.movie
    @comments = @movie.comments
    @conversation = Conversation.new
    if @comment.update(comment_params)
      redirect_to movie_path(@movie)
    else
      render 'movies/show'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to movie_path(@comment.movie)
  end

  def show
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :movie_id, :user_id)
  end

end
