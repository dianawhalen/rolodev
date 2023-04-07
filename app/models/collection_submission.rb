class CollectionSubmission < ApplicationRecord
  belongs_to :collection
  belongs_to :submission, dependent: :destroy
end
