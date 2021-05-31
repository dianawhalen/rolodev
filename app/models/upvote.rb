class Upvote < ApplicationRecord
  belongs_to :user
	belongs_to :submission

  validates :click, presence: true
end
