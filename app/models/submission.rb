class Submission < ApplicationRecord
  belongs_to :user
  has_many :upvotes, dependent: :destroy
  has_many :upvoters, through: :upvotes, source: :user
  has_many :collection_submissions, dependent: :destroy
  has_many :collections, through: :collection_submissions

  validates :title, presence: true
  validates :url, format: { with: URI::DEFAULT_PARSER.make_regexp }

  def upvoted_by?(user)
    upvoters.exists?(user.id)
  end

  scope :most_upvotes, -> {
    select('submissions.*, count(upvotes.id) AS upvotes_count')
    .joins(:upvotes)
    .group('submissions.id')
    .order('upvotes_count DESC')
    .limit(5)
  }
end
