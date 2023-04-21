class Collection < ApplicationRecord
  belongs_to :user
  has_many :collection_submissions, dependent: :destroy
  has_many :submissions, through: :collection_submissions

  validates :name, presence: true
end
