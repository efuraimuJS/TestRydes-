class AddIndexToUsersOfInstructorRiderIds < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :instructor_id
    add_index :users, :rider_id
  end
end
