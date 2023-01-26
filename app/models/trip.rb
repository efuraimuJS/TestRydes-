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
class Trip < ApplicationRecord
  include AASM

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  index_name [Rails.env, Rails.application.class.module_parent_name.underscore, self.name.downcase].join('_')

  belongs_to :rider, -> {where(type: 'Rider')}, class_name: 'User'
  # , :inverse_of => :trips
  belongs_to :instructor, -> {where(type: 'Instructor')}, class_name: 'User'
  # , :inverse_of => :trips

  validates_presence_of :instructor
  validates_presence_of :rider

  aasm do # default column: aasm_state
    state :pending, initial: true
    state :confirmed
    state :in_progress
    state :completed
    state :canceled
    state :paid

    event :confirm, guard: :instructor_only do
      transitions from: :pending, to: :confirmed
    end
    event :start, guard: :instructor_only do
      transitions from: :confirmed, to: :in_progress
    end
    event :finish, guard: :instructor_only do
      transitions from: :in_progress, to: :completed
    end
    event :pay, guard: :rider_only do
      transitions from: :completed, to: :paid
    end
    event :cancel do
      transitions from: [:pending, :confirmed, :in_progress], to: :canceled
    end
  end

  private

  def instructor_only
    user_signed_in? && current_user.type == "Instructor"
  end

  def rider_only
    user_signed_in? && current_user.type == "Rider"
  end


end
