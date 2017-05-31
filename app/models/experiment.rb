class Experiment < ApplicationRecord
  belongs_to :experiment_proposal
  belongs_to :proposer, class_name: "User"
  has_many :comments, as: :commentable
  has_many :observations, as: :observable
end
