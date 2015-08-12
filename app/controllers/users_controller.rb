class UsersController < ApplicationController
  def new
    if current_user
      redirect_to user_path(current_user)
    else
      @user = User.new
      render :new
    end
  end

  def create
    if current_user
      redirect_to user_path(current_user)
    else
      user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        redirect_to user_path(current_user)
      else
        redirect_to signup_path
      end
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def edit 
    id = user_params[:id]
    user = User.find(id)
    render :edit
  end

  def update
    id = user_params[:id]
    user = User.find(id)
    user.update_attributes(user_params)

    redirect_to user_path(current_user)
  end

  private 
    def user_params
      params.require(:user).permit(:name, :email, :password, :city)
    end

end
