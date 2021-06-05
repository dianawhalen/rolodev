class User < ApplicationRecord
  has_secure_password
  has_many :submissions
  has_many :upvotes
  has_many :upvoted_submissions, through: :upvotes, source: :submission
	# has_many :collections, through: :submissions

  validates :username, uniqueness: true, presence: true
  validates :email, presence: true

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
      user.username = auth.info.nickname
      user.email = auth.info.email
      user.password = SecureRandom.hex(10)
    end
  end
end
