class CitiesController < ApplicationController
  def index
    @cities = City.all
  end
  
  def show
    # Finds the current city id
    @city = City.friendly.find(params[:name])
    render :show
  end

end
