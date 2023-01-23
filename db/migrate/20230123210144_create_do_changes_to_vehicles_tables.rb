class CreateDoChangesToVehiclesTables < ActiveRecord::Migration[7.0]
  def change
    change_table :vehicles do |t|
      t.remove :brand
    end
    add_reference :vehicles, :vehicle_models
    add_reference :vehicles, :vehicle_brands

  end
end
