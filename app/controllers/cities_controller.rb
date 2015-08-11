class CitiesController < ApplicationController
  def index
    @cities = City.find(:all)
  end
  
  def show
    @city = City.find(params[:id])
    @posts = Post.find_by(city[:id])
  end
end
