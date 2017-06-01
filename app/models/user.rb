class User < ApplicationRecord
  has_many :experiments#, foreign_key: "Experimenter"
  has_many :experiment_proposals#, foreign_key: "Proposer"
  has_many :observations
  has_many :comments

  has_secure_password

  validates :username, :first_name, :last_name, :email, :presence => true
  validates :email, :username, :uniqueness => true

  validates_format_of :email, with: /\@dbc\.com/, message: ' :You should have an email address from @dbc.com.'
  validates :password, length: { minimum: 6 }
end
