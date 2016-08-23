class AddIntegrationTypeRefToIntegrations < ActiveRecord::Migration[5.0]
  def change
    add_reference :integrations, :integration_type, index: true, foreign_key: true
  end
end
