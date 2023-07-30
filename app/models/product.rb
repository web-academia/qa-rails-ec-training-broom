class Product < ApplicationRecord
  has_many :purchases, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :user
  belongs_to :category
  belongs_to :sale_status
  belongs_to :product_status

  def self.search(keyword, category_id)
    products = Product.all
    products = products.where(["product_name LIKE ?", "%#{keyword}%"]) if keyword.present?
    products = products.where(category_id: category_id) if category_id.present?
    products
  end
end
