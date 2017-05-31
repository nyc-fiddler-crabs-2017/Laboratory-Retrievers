class Comment < ApplicationRecord
  belongs_to :commentable, :polymorphic => true
  belongs_to :user

  validates :body, :user, :presence => true
end
