class UsersController < ApplicationController
  include SessionsHelper

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.assign_attributes(user_params)
    if @user.save
      flash[:success] = t "user_update.success"
      redirect_to @user
    else
      flash.now[:danger] = t "user_update.failure"
      render "edit"
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user.id == current_user.id
      @user.destroy!
      reset_session
      flash[:success] = t "user_destroy.success"
      redirect_to root_path
    else
      flash.now[:danger] = t "user_destroy.failure"
      render "edit"
    end
  end

  private

    def user_params
      params.require(:user).permit(:last_name, :first_name, :zipcode, :prefecture, :municipality, :address, :apartments, :email, :phone_number)
    end
end
