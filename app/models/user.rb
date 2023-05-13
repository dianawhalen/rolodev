class User < ApplicationRecord
  has_secure_password
  has_many :submissions, dependent: :destroy
  has_many :upvotes, dependent: :destroy
  has_many :upvoted_submissions, through: :upvotes, source: :submission
  has_many :collections, dependent: :destroy

  validates :username, uniqueness: true, presence: true
  validates :email, presence: true

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
      user.username = auth.info.nickname
      user.email = auth.info.email
      user.password = SecureRandom.hex(10)
      user.from_omniauth = true
    end
  end

  def upvoted?(submission)
    upvoted_submissions.include?(submission)
  end

  def upvote_for(submission)
    upvotes.find_by(submission: submission)
  end
end
