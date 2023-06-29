class Product < ApplicationRecord
  has_many :purchases, dependent: :destroy
  has_many :order_details, dependent: :destroy
  # TODO: User関係の構築ができたタイミングでコメントアウトを解除すること
  belongs_to :user
  belongs_to :category
  belongs_to :sale_status
  belongs_to :product_status
end
