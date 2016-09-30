class LearningResource < ApplicationRecord
  belongs_to :learning_resource_type
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true

  validates :title, presence: true,
                    length: { minimum: 8 },
                    uniqueness: true
  validates :link,  presence: true,
                    uniqueness: true

end
