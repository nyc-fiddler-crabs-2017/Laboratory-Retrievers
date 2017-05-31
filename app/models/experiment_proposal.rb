class ExperimentProposal < ApplicationRecord
  # belongs_to :proposer, class_name: "User"
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :observations, as: :observable

  validates :title, :summary, :hypothesis, :status, :user_id, :presence => true
end
