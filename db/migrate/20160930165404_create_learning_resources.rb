class CreateLearningResources < ActiveRecord::Migration[5.0]
  def change
    create_table :learning_resources do |t|
      t.string :title
      t.string :link
      t.references :learning_resource_type, index: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :learning_resources, [:user_id, :created_at]
  end
end
