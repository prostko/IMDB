class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      session[:history] = ["Logged in at #{Time.now}"]
      redirect_to user_path(@user)
    else
      render "new"
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end


end
