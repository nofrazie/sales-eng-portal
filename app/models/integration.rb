class Integration < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  belongs_to :integration_type
  mount_uploader :picture, PictureUploader
  validate :picture_size

  validates :name,         presence: true
  validates :description,  presence: true,
                          length: { minimum: 20 }
  validates :built_by,     presence: true
  validates :status,       presence: true
  validates :summary,      presence: true,
                          length: { minimum: 20 }

  private
    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
