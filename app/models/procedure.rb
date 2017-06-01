class Procedure < ApplicationRecord
  validates :step, uniqueness: {scope: :experiment_id}
  validates :body, presence: true

  belongs_to :experiment
  has_many :observations, as: :observable
end
