class IntegrationType < ApplicationRecord
  has_many :integrations

  validates :name, presence: true
  validates :name, uniqueness: true
end
