class CartItemsController < ApplicationController
  include SessionsHelper

  def create # rubocop:disable Metrics/AbcSize
    @cart = Cart.find_or_create_by!(user_id: current_user.id)
    if (item = @cart.cart_items.find_by(product_id: params[:product_id]))
      item.quantity += params[:quantity].to_i
    else
      item = @cart.cart_items.new(product_id: params[:product_id], cart_id: @cart.id, quantity: params[:quantity].to_i)
    end
    if item.save
      redirect_to cart_path
    else
      flash.now[:danger] = t "cart_item_create.failure"
      redirect_to item.product
    end
  end

  def update
    if CartItem.find_by(id: params[:id]).update(quantity: params[:quantity].to_i)
      redirect_to cart_path
    else
      flash.now[:danger] = t "cart_item_updete.failure"
      render "carts/show"
    end
  end

  def destroy
    CartItem.find_by(id: params[:id]).destroy!
    redirect_to cart_path
  end
end
