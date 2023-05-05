class CollectionSubmission < ApplicationRecord
  belongs_to :collection
  belongs_to :submission

  validates :submission_id, uniqueness: { scope: :collection_id }
end
