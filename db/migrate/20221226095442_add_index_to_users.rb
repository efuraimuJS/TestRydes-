class AddIndexToUsers < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :type
  end
end
