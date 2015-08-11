class UsersController < ApplicationController
  def new
    if current_user
      redirect_to profile_path
    else
      @user = User.new
      render :new
    end
  end

  def create
    if current_user
      redirect_to profile_path
    else
      user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        redirect_to profile_path
      else
        redirect_to signup_path
      end
    end
  end

  def show
    @current_user = User.find(session[:user_id])
    render :show
  end

  private 
    def user_params
      params.require(:user).permit(:name, :email, :password, :city)
    end

end
