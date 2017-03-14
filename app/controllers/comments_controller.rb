class CommentsController < ApplicationController
  def new
    @comment = Post.new(user_id: current_user.id, movie_id: params[:user_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @movie = @comment.movie
    
    if @comment.save
      redirect_to movie_path()
    else
      render 'movies/show'
    end
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
  end

  def show
  end
   
  private
  def comment_params
    params.require(:comment).permit(:content, movie_id: params[:id], user_id: current_user.id)
  end 
end
