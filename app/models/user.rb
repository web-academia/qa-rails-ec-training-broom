class User < ApplicationRecord
  VAILD_PASSWORD_REGEXP = /\A[a-zA-Z0-9_-]+\z/
  VAILD_EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VAILD_NUMBER_REGEXP = /\A[0-9]+\z/
  has_secure_password

  has_many :orders, dependent: :destroy
  has_many :products, dependent: :destroy
  has_one :cart, dependent: :destroy
  belongs_to :user_classfication

  validates :password, length: { in: 6..15 }, allow_blank: true, on: :update
  validates :password, format: { with: VAILD_PASSWORD_REGEXP }, allow_blank: true, on: :update
  validates :password, presence: true

  validates :last_name, length: { maximum: 10 }, presence: true
  validates :first_name, length: { maximum: 10 }, presence: true

  validates :zipcode, length: { is: 7 }
  validates :zipcode, format: { with: VAILD_NUMBER_REGEXP }, presence: true

  validates :prefecture, length: { maximum: 5 }, presence: true
  validates :municipality, length: { maximum: 10 }, presence: true
  validates :address, length: { maximum: 15 }, presence: true
  validates :apartments, length: { maximum: 20 }, presence: true

  validates :email, format: { with: VAILD_EMAIL_REGEXP }
  validates :email, uniqueness: true, presence: true

  validates :phone_number, length: { maximum: 15 }
  validates :phone_number, format: { with: VAILD_NUMBER_REGEXP }
  validates :phone_number, presence: true
end
