class SessionsController < ApplicationController
  include SessionsHelper
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user
    else
      render "new"
    end
  end

  def destroy
    logout
    @current_user = nil
    redirect_to login_path
  end
end
