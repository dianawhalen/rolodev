class User < ApplicationRecord
  has_secure_password
  has_many :submissions
  has_many :upvotes
  has_many :upvoted_submissions, through: :upvotes, source: :submission
	# has_many :collections, through: :submissions

  validates :username, :email, presence: true
end
