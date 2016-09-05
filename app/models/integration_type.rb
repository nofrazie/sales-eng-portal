class IntegrationType < ApplicationRecord
  has_many :integrations

  validates :name, presence: true
end
