class Talk < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :talk_users, dependent: :destroy
  has_many :users, through: :talk_users
  has_many :comments, as: :commentable, dependent: :destroy

  
  validates :user, :title, :description, :begin_date, :event_id, :end_date, presence: true  
end
