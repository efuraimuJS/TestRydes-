class CreateVehicleModels < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicle_models do |t|
      t.string :model_name

      t.timestamps
    end
  end
end
