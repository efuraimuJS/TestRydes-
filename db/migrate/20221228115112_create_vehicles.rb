class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|

      t.timestamps
    end
    add_reference :vehicles, :instructor, references: :user, foreign_key: {to_table: :users}
  end
end
