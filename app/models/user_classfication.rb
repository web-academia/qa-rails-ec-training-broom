class UserClassfication < ApplicationRecord
  has_many :user_classfications, dependent: :destroy
end
