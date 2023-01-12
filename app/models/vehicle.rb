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
class Vehicle < ApplicationRecord
  belongs_to :instructor, -> {where(type: 'Instructor')}, class_name: 'User'
  # , :inverse_of => :vehicles

  validates_presence_of :instructor
end
