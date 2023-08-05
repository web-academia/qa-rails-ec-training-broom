class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :user

  def total_price
    order_details.sum do |order_detail|
      order_detail.product.price * order_detail.order_quantity
    end
  end
end
