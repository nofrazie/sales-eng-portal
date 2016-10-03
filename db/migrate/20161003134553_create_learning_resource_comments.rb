class CreateLearningResourceComments < ActiveRecord::Migration[5.0]
  def change
    create_table :learning_resource_comments do |t|
      t.integer :learning_resource_id
      t.text :body
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :learning_resource_comments, :learning_resource_id
  end
end
