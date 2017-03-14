class UsersController < ApplicationController

  def new
    @new_user = User.new
  end

  def create
    @new_user = User.new(user_params)

    if @new_user.save
      session[:user_id] = @new_user.id
      session[:history] = ["You logged in at #{Time.now}"]
      redirect_to user_path(@new_user.id)
    else
      render 'new'
    end

  end


  def show
      @user = User.find(params[:id])
      @favorited_movies = @user.favorited_movies
  end


  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  # def edit
  # end
  # def update
  # end
end
