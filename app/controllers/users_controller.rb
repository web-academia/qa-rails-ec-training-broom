class UsersController < ApplicationController
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
      flash[:success] = t user_update.success
      redirect_to @user
    else
      flash.now[:danger] = t user_update.failure
      render "edit"
    end
  end

  private

    def user_params
      params.require(:user).permit(:last_name, :first_name, :zipcode, :prefecture, :municipality, :address, :apartments, :email, :phone_number)
    end
end
