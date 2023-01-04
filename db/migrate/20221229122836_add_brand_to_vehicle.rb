class AddBrandToVehicle < ActiveRecord::Migration[7.0]
  def change
    add_column :vehicles, :brand, :string
  end
end
