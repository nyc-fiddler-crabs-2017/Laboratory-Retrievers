class User < ApplicationRecord
  has_many :experiments
  has_many :experiment_proposals

  has_secure_password

  validates :username, :first_name, :last_name, :email, :password, :presence => true
  validates :email, :username, :uniqueness => true
end
