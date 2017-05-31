class ExperimentProposal < ApplicationRecord
  belongs_to :experimenter, class_name: "User"
  has_many :comments, as: :commentable
end
