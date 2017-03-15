class SessionsController < ApplicationController
  include ApplicationHelper
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      session[:history] = []
      session[:history] << ["You logged in", " at #{current_time}"]
      redirect_to user_path(@user)
    else
      @errors = ["Invalid Username/Password"]
      render "new"
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end


end
