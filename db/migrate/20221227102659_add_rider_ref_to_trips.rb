class AddRiderRefToTrips < ActiveRecord::Migration[7.0]
  def change
    add_reference :trips, :rider, references: :user, foreign_key: {to_table: :users}
  end
end
