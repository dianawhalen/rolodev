class UpvotedSubmission < ApplicationRecord
  belongs_to :user
  belongs_to :submission, dependent: :destroy
end
