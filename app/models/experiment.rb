class Experiment < ApplicationRecord
  belongs_to :experiment_proposal
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :observations, as: :observable
end
