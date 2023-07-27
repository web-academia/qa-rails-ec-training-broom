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
      flash[:success] = '更新に成功しました'
      redirect_to @user
    else
      flash.now[:danger] = '更新に失敗しました'
      render "edit"
    end
  end

  def user_params
    params.require(:user).permit(:password, :last_name, :first_name, 
    :zipcode, :prefecture, :municipality, :address, :apartments, :email, :phone_number, :user_classfication, :delete_flag)
  end

end