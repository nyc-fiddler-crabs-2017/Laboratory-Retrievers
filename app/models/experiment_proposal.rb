class ExperimentProposal < ApplicationRecord
  # belongs_to :proposer, class_name: "User"
  belongs_to :user
  has_many :experiments, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :observations, as: :observable, dependent: :destroy

  validates :title, :summary, :hypothesis, :status, :user_id, :presence => true
end
