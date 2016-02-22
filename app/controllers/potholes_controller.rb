class PotholesController < ApplicationController
	def index
	end

  def create
  	@pothole = Pothole.new(params[:id])
  	if @pothole.save
  		redirect_to potholes_create_path
  	else
  		redirect_to potholes_create_path
  		flash[alert: "Invalid Input Attempt."]
	end
  end
end
