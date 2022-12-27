class RemoveInstructorRideFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :instructor_id
    remove_column :users, :rider_id

    remove_index :users, :instructor_id
    remove_index :users, :rider_id

  end
end
