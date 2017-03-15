class UsersController < ApplicationController
  include ApplicationHelper

  def new
    @new_user = User.new
  end

  def create
    @new_user = User.new(user_params)

    if @new_user.save
      session[:user_id] = @new_user.id
      session[:history]=[["Created New Profile", " at #{current_time}"]]
      redirect_to user_path(@new_user.id)
    else
      render 'new'
    end

  end


  def show
    require_user
    @user = User.find(params[:id])
    @favorited_movies = @user.favorited_movies
    authorized(@user.id)
    # binding.pry
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
