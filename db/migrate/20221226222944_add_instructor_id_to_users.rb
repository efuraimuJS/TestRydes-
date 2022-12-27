class AddInstructorIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :instructor_id, :integer
  end
end
