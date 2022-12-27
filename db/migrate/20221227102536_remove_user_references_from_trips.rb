class RemoveUserReferencesFromTrips < ActiveRecord::Migration[7.0]
  def change
    remove_reference :trips, :user, index: true, foreign_key: true

  end
end
