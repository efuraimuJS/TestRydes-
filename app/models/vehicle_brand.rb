# == Schema Information
#
# Table name: vehicle_brands
#
#  id                :bigint           not null, primary key
#  brand_name        :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  vehicle_models_id :bigint
#
# Indexes
#
#  index_vehicle_brands_on_vehicle_models_id  (vehicle_models_id)
#
class VehicleBrand < ApplicationRecord
  has_one_attached :brand_image do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  has_many :vehicle_models
end
