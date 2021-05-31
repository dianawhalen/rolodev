class Submission < ApplicationRecord
  belongs_to :user
  # belongs_to :collection
	has_many :upvotes
	has_many :users, through: :upvotes

  validates :title, :url, presence: true
end
