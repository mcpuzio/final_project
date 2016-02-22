class SessionsController < ApplicationController
  def new
  end

  def create
  	 @user = User.where(name: params[:name]).first

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to potholes_path
    else
      redirect_to login_path
    end
  end

  def destroy
  	session.clear
  	redirect_to login_path
  end

end
