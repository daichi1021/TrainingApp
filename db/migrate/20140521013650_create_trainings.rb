class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.integer :user_id
      t.string :date
      t.string :condition
      t.string :training_detail
      t.integer :running_distance

      t.timestamps
    end
    add_index :trainings, [:user_id]
  end
end
