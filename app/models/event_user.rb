class EventUser < ApplicationRecord
  belongs_to :event
  belongs_to :user
  
  validates :user, :event, presence: true
  validates :event, uniqueness: { scope: :user, message: "A user just can be added one time" }
end
