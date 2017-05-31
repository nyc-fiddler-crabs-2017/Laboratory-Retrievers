class Procedure < ApplicationRecord
  validates :step, uniqueness: {scope: :experiment_id}

  belongs_to :experiment
  has_many :observations, as: :observable
end
