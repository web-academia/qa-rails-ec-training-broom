class Product < ApplicationRecord
  has_many :purchases, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :user
  belongs_to :category
  belongs_to :sale_status
  belongs_to :product_status

  def self.search(keyword, selected_category)
    
    # return Product.all unless keyword && selected_category
    # Product.where(['product_name LIKE ?', "%#{keyword}%" ]).where(category_id: selected_category)

    # binding.pry
     
    if keyword.present? && selected_category.present?
      Product.where(['product_name LIKE ?', "%#{keyword}%" ]).where(category_id: selected_category)
    elsif keyword.present? && selected_category.empty?
      Product.where(['product_name LIKE ?', "%#{keyword}%" ])
    elsif keyword.blank? && selected_category.present?
      Product.where(category_id: selected_category) 
    else
      return Product.all
    end

  end
end
