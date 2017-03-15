class ConversationsController < ApplicationController
  include ApplicationHelper

  def create
    @conversation = Conversation.new(conversation_params)
    @comment = @conversation.comment
    @movie = @comment.movie
    @comments = @movie.comments
    if @conversation.save
      activity_logger('conversation', @movie)
      redirect_to movie_path(@movie)
    else
      render 'movies/show'
    end
  end

  def edit
    @conversation = Conversation.find_by(id: params[:id])
  end

  def destroy
    @conversation = Conversation.find(params[:id])
    @movie =@conversation.comment.movie
    @conversation.destroy
    redirect_to movie_path(@movie)
  end

  def show
  end

  private
  def conversation_params
    params.require(:conversation).permit(:content, :comment_id, :user_id)
  end

end
