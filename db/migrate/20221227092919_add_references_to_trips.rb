class AddReferencesToTrips < ActiveRecord::Migration[7.0]
  def change
    add_reference :trips, :user, index: true, foreign_key: true
  end
end
