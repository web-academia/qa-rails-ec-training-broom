class UserClassfication < ApplicationRecord
  has_many :users, dependent: :destroy
end
