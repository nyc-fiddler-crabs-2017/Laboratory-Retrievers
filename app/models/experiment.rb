class Experiment < ApplicationRecord
  belongs_to :experiment_proposal
  # belongs_to :experimenter, class_name: "User"
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :observations, as: :observable, dependent: :destroy
  has_many :procedures, dependent: :destroy

  validates :user, :status, :experiment_proposal, :presence => true
end
