# == Schema Information
#
# Table name: trips
#
#  id            :bigint           not null, primary key
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
class Trip < ApplicationRecord
  belongs_to :rider, -> {where(type: 'Rider')}, class_name: 'User', :inverse_of => :trips
  belongs_to :instructor, -> {where(type: 'Instructor')}, class_name: 'User', :inverse_of => :trips

  validates_presence_of :instructor
  validates_presence_of :rider
end
