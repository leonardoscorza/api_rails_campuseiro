class Event < ApplicationRecord
  belongs_to :user
  has_many :talks, dependent: :destroy
  has_many :event_users, dependent: :destroy
  has_many :users, through: :event_users
  has_many :comments, as: :commentable, dependent: :destroy

  validates :user, :title, :description, :begin_date, :end_date, presence: true
end
