class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :products, dependent: :destroy
  belongs_to :user_classfications
end
