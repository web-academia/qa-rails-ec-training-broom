class Product < ApplicationRecord
  has_many :purchases, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :user
  belongs_to :category
  belongs_to :sale_status
  belongs_to :product_status

  def self.search(keyword, category_id)
     
    if keyword.present? && category_id.present?
      Product.where(['product_name LIKE ?', "%#{keyword}%" ]).where(category_id: category_id)
    elsif keyword.present? && category_id.empty?
      Product.where(['product_name LIKE ?', "%#{keyword}%" ])
    elsif keyword.blank? && category_id.present?
      Product.where(category_id: category_id) 
    else
      return Product.all
    end

  end
end
