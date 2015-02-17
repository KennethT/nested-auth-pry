class LocationsController < ApplicationController
  before_action :authenticate, except: [:index, :show]
  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
    @company = Company.find(params[:company_id])
  end

  def create
    @location = Location.new(location_params)
    @location.company_id = params[:company_id]
    if @location.save
      redirect_to root_path
    else
      render :new
  end
end


private
  def location_params
    params.require(:location).permit(:city, :street_name, :state, :zip_code, :country)
  end
end
