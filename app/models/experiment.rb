class Experiment < ApplicationRecord
  belongs_to :experiment_proposal
  belongs_to :user
end
