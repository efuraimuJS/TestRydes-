class FixTypeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :account_type, :type
  end
end
