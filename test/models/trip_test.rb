# == Schema Information
#
# Table name: trips
#
#  id            :bigint           not null, primary key
#  aasm_state    :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  instructor_id :bigint
#  rider_id      :bigint
#
# Indexes
#
#  index_trips_on_instructor_id  (instructor_id)
#  index_trips_on_rider_id       (rider_id)
#
# Foreign Keys
#
#  fk_rails_...  (instructor_id => users.id)
#  fk_rails_...  (rider_id => users.id)
#
require "test_helper"

class TripTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
