class User < ApplicationRecord
  has_secure_password
  validates :name, :email, presence: true
  validates :email, uniqueness: true

  has_many :events, dependent: :destroy
  has_many :talks, dependent: :destroy
  has_many :comments, dependent: :destroy
end
