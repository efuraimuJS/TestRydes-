# == Schema Information
#
# Table name: vehicle_models
#
#  id                 :bigint           not null, primary key
#  vehicle_model_name :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
require "test_helper"

class VehicleModelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
