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
class Vehicle < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  index_name [Rails.env, Rails.application.class.module_parent_name.underscore, self.name.downcase].join('_')

  belongs_to :instructor, -> {where(type: 'Instructor')}, class_name: 'User'
  # , :inverse_of => :vehicles

  enum :vehicle_type, {SUV: 0, Sedan: 1, 'Hatchback/Wagon': 2,
                       Minivan: 3, Van: 4, 'Pickup Truck': 5,
                       Lorry: 6, Luxury: 7, 'Hybrid/EV': 8}

  enum :transmission_type, {Manual: 0, Automatic: 1, 'Automated Manual':2, CVT: 3}

  enum :control_type, {'Dual Control': 0, 'Single Control': 1}

  validates_presence_of :instructor

  after_commit :update_instructor

  private
  def update_instructor
    Instructor.update_vehicle(self)
  end
end
