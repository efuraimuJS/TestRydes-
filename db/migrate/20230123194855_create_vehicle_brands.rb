class CreateVehicleBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicle_brands do |t|
      t.string :brand_name

      t.timestamps
    end
  end
end
