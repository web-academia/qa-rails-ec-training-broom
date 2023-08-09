class CartsController < ApplicationController
  include SessionsHelper
  
  def show
    @cart = Cart.find_by(user_id: current_user.id)
  end
end
