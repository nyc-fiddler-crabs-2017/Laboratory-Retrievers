class User < ApplicationRecord
  has_many :experiments#, foreign_key: "Experimenter"
  has_many :experiment_proposals#, foreign_key: "Proposer"
  has_many :observations
  has_many :comments

  has_secure_password

  validates :username, :first_name, :last_name, :email, :presence => true
  validates :email, :username, :uniqueness => true
end
