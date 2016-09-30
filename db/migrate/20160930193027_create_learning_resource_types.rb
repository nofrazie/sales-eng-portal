class CreateLearningResourceTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :learning_resource_types do |t|
      t.string :name
      t.timestamps
    end
  end
end
