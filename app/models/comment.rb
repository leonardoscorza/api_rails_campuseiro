class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true  
  validates :body, :commentable, presence: true  
end
