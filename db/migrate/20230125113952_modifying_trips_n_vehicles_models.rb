class ModifyingTripsNVehiclesModels < ActiveRecord::Migration[7.0]
  def change
    add_column :vehicles, :vehicle_number_plate, :string
    add_column :trips, :aasm_state, :string
  end
end
