class AddVehicleTypeToVehicles < ActiveRecord::Migration[7.0]
  def change
    add_column :vehicles, :vehicle_type, :integer
    add_column :vehicles, :transmission_type, :integer
    add_column :vehicles, :control_type, :integer
  end
end
