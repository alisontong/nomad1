class CitiesController < ApplicationController
  def index
    @cities = City.find(:all)
  end
  
  def show
    # Finds the current city id
    @city = City.friendly.find(params[:name])
    render :show
  end

end
