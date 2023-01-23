# == Schema Information
#
# Table name: vehicles
#
#  id                :bigint           not null, primary key
#  control_type      :integer
#  transmission_type :integer
#  vehicle_type      :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  instructor_id     :bigint
#  vehicle_brands_id :bigint
#  vehicle_models_id :bigint
#
# Indexes
#
#  index_vehicles_on_instructor_id      (instructor_id)
#  index_vehicles_on_vehicle_brands_id  (vehicle_brands_id)
#  index_vehicles_on_vehicle_models_id  (vehicle_models_id)
#
# Foreign Keys
#
#  fk_rails_...  (instructor_id => users.id)
#
require "test_helper"

class VehicleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
