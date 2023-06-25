class Product < ApplicationRecord
    has_many :purchases
    # belongs_to :user
    belongs_to :category
    belongs_to :sale_status
    belongs_to :product_status
end
