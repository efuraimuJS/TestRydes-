# == Schema Information
#
# Table name: vehicles
#
#  id            :bigint           not null, primary key
#  brand         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  instructor_id :bigint
#
# Indexes
#
#  index_vehicles_on_instructor_id  (instructor_id)
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
