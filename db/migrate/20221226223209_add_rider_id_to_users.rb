class AddRiderIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :rider_id, :integer
  end
end
