class User < ApplicationRecord
  has_many :submissions, dependent: :destroy
  has_many :upvotes, dependent: :destroy
  has_many :upvoted_submissions, through: :upvotes, source: :submission
  has_many :collections, dependent: :destroy
end
