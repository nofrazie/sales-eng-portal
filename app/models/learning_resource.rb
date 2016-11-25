class LearningResource < ApplicationRecord
  acts_as_votable
  belongs_to :learning_resource_type
  belongs_to :user
  validates :user_id, presence: true

  validates :title, presence: true,
                    length: { minimum: 4 },
                    uniqueness: true
  validates :link,  presence: true,
                    uniqueness: true
  has_many :learning_resource_comments
end
