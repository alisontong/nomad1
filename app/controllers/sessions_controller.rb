class SessionsController < ApplicationController
  def new
    # redirect user if already logged in
    if current_user
      redirect_to profile_path
      flash[:notice] = "You logged in!"
    else
      render :new
      flash[:error] = "Try again"
    end
  end

  def create
    user = User.find_by_email(user_params[:email])
    # if user exists AND password entered is correct
    if user && user.authenticate(user_params[:password])
      # save user id to session to keep them logged in
      # when they navigate around our site
      session[:user_id] = user.id
      flash[:notice] = "Successfully logged in."
      redirect_to profile_path
    else
      # if user's login doesn't work, send them back to the login form
      flash[:error] = "Incorrect email or password. Please try again."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Successfully logged out."
    redirect_to login_path
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end