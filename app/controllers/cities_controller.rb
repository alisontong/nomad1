class CitiesController < ApplicationController
  def index
    @cities = City.find(:all)
  end
  
  def show
    # Finds the current city id
    @city = City.find(params[:id])
    # Find all posts with same city id
    @posts = Post.find_by(@city.id)
  end
end
