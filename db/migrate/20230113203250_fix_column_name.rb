class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :type, :account_type
  end
end
