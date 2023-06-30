class UserClassfication < ApplicationRecord
  has_many :user, dependent: :destroy
end
