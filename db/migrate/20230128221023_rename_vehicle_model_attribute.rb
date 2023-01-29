class RenameVehicleModelAttribute < ActiveRecord::Migration[7.0]
  def change
    change_table :vehicle_models do |t|
      t.rename :model_name, :vehicle_model_name
    end

    change_table :vehicle_brands do |t|
      t.rename :brand_name, :vehicle_brand_name
    end
  end

end
