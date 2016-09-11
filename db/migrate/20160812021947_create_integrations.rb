class CreateIntegrations < ActiveRecord::Migration[5.0]
  def change
    create_table :integrations do |t|
      t.string :name
      t.text :description
      t.text :built_by
      t.string :status
      t.text :summary
      t.references :integration_type, index: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :integrations, [:user_id, :created_at]
  end
end
