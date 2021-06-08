class Submission < ApplicationRecord
  belongs_to :user
  # belongs_to :collection
	has_many :upvotes
	has_many :users, through: :upvotes

  validates :title, :url, presence: true

  scope :alpha, -> { order(:title) }
  scope :most_upvotes, -> { left_joins(:upvotes).group('submissions.id').order('count(upvotes.submission_id) desc') }
end
