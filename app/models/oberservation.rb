class Oberservation < ApplicationRecord
  belongs_to :observable, :polymorphic => true
  has_many :comments, as: :commentable
end
