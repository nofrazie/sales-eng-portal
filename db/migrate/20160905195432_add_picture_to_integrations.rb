class AddPictureToIntegrations < ActiveRecord::Migration[5.0]
  def change
    add_column :integrations, :picture, :string
  end
end
