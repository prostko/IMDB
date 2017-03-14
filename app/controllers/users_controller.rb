class UsersController < ApplicationController

  def new
    @new_user = User.new
  end

  def create
    @new_user = User.new(user_params)
    if @new_user.save
      session[:user_id] = @new_user.id
      redirect_to user_path(@new_user.id)
    else
      render 'new'
    end
  end

  # def edit

  # end

  def show
      @user = User.find(params[:id])
  end

  # def update

  # end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
