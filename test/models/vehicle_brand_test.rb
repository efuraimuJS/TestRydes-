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
require "test_helper"

class VehicleBrandTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
