class OrdersController < ApplicationController
  include SessionsHelper

  def create
    ActiveRecord::Base.transaction do
      @order = Order.create!(user_id: current_user.id, order_date: DateTime.now, order_number: rand(0o00000001..999_999_999))
      cart_items = current_user.cart.cart_items
      cart_items.each do |cart_item|
        OrderDetail.create!(product_id: cart_item.product_id,
                            order_id: @order.id,
                            shipment_status_id: 1,
                            order_quantity: cart_item.quantity,
                            shipment_date: DateTime.now)
      end
      cart_items.destroy_all
      render "purchase_completed"
    end
  rescue
    flash.now[:danger] = t "orders_create.failure"
    redirect_to cart_path
  end
end
