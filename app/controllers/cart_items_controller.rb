class CartItemsController < ApplicationController
  include SessionsHelper

  def create
    @cart = Cart.find_or_create_by!(user_id: current_user.id)
    @product = Product.find_by(id: params[:product_id]) 
    if @cart.cart_items.find_by(product_id: params[:product_id], cart_id: @cart.id)
      item = @cart.cart_items.find_by(product_id: params[:product_id], cart_id: @cart.id)
      item.quantity += params[:quantity].to_i
    else
      item = @cart.cart_items.new(product_id: params[:product_id], cart_id: @cart.id)
      item.quantity = params[:quantity].to_i
    end
    item.save
    redirect_to cart_path
  end

  def update
    CartItem.find_by(id: params[:id]).update(quantity: params[:quantity].to_i)
    redirect_to cart_path
  end

  def destroy
    CartItem.find_by(id: params[:id]).destroy!
    redirect_to cart_path
  end
end
