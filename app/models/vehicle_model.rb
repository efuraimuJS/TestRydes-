# == Schema Information
#
# Table name: vehicle_models
#
#  id                 :bigint           not null, primary key
#  vehicle_model_name :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class VehicleModel < ApplicationRecord
  has_many_attached :model_images do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  has_one_attached :model_video do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end


  belongs_to :vehicle_brand
end
