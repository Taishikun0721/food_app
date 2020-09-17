class User < ApplicationRecord
  has_many :foods, dependent: :destroy
  has_secure_password

  validates :nickname, presence: true, length: { maximum: 15 }
  validates :email, presence: true
end
