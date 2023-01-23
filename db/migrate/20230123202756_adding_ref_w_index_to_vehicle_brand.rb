class AddingRefWIndexToVehicleBrand < ActiveRecord::Migration[7.0]
  def change
    add_reference :vehicle_brands, :vehicle_models
  end
end
