class User < ApplicationRecord  
  VAILD_PASSWORD_REGEXP = /\A[a-zA-Z0-9_\-]+\z/
  VAILD_EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VAILD_NUMBER_REGEXP = /\A[0-9]+\z/

  has_many :orders, dependent: :destroy
  has_many :products, dependent: :destroy
  belongs_to :user_classfication

  validates :password, length: { in: 6..15 }
  validates :password, format: { with: VAILD_PASSWORD_REGEXP }

  validates :last_name, length: { maximum: 10 }
  validates :first_name, length: { maximum: 10 }

  validates :zipcode, length: { is: 7 }
  validates :zipcode, format: { with: VAILD_NUMBER_REGEXP }

  validates :prefecture, length: { maximum: 5 } 
  validates :municipality, length: { maximum: 10 } 
  validates :address, length: { maximum: 15 } 
  validates :apartments, length: { maximum: 20 } 

  validates :email, format: { with: VAILD_EMAIL_REGEXP }
  validates :email, uniqueness: true

  validates :phone_number, length: { maximum: 15 }
  validates :phone_number, format: { with: VAILD_NUMBER_REGEXP }
end
