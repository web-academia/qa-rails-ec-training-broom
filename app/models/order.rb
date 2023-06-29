class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  # TODO: User関係の構築ができたタイミングでコメントアウトを解除すること
  belongs_to :user
end
