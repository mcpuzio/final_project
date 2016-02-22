class UsersController < ApplicationController
  def index
  	@users = User.all.reverse
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      session[:user_id] = @user.id
  		redirect_to potholes_path
  	else
  		redirect_to :back
	    flash[alert: "Unsucessful Sign-up"]
	   end
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(user_params)
  end

  def destroy
    @user = User.find(user_params)
     if @user.destroy
     redirect_to login_path
   else
      redirect_to :back
      flash[alert: "Unsucessful Logout"]
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :address, :password)
  end
end
