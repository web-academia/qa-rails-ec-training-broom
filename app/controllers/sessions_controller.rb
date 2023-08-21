class SessionsController < ApplicationController
  include SessionsHelper
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      flash[:success] = t "user_login.success"
      redirect_to user
    else
      flash.now[:danger] = t "user_login.failure"
      render "new"
    end
  end

  def destroy
    logout
    @current_user = nil
    flash[:success] = t "user_logout.success"
    redirect_to login_path
  end
end
