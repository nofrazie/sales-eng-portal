class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title,         presence: true,
                            length: { minimum: 4 },
                            uniqueness: true
  validates :body,          presence: true,
                            length: { minimum: 20 },
                            uniqueness: true
end
