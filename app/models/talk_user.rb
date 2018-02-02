class TalkUser < ApplicationRecord
  belongs_to :talk
  belongs_to :user

  validates :talk, :user, presence: true  
  validates :talk, uniqueness: { scope: :user, message: "A user just can be added one time" }
end
