class AddInstructorRefToTrips < ActiveRecord::Migration[7.0]
  def change
    add_reference :trips, :instructor, references: :user, foreign_key: {to_table: :users}
  end
end
