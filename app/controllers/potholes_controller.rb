class PotholesController < ApplicationController
	def index
    @pothole = Pothole.new(params[:id])
	end

  def new
    @pothole = Pothole.new(params[:id])
  end

  def create
  	@pothole = Pothole.new(pothole_params)
      @latitude = @pothole[:latitude]
      @longitude = @pothole[:longitude]
  	if @pothole.save
  		redirect_to potholes_path
  	else
  		redirect_to potholes_path
  		flash[alert: "Invalid Input Attempt."]
	 end
  end

  private

  def pothole_params
    params.require(:pothole).permit(:street, :date_reported, :size, :description, :latitude, :longitude) 
  end
end
