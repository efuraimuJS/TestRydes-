module ApplicationHelper
  def vehicle_brand_name(vehicle_brand_id)
    VehicleBrand.find_by_id(vehicle_brand_id).vehicle_brand_name.to_s.capitalize
  end

  def vehicle_model_name(vehicle_model_id)
    VehicleModel.find_by_id(vehicle_model_id).vehicle_model_name.to_s.upcase
  end
end
