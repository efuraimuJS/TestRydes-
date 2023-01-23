# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  avatar_url             :string
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  full_name              :string
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  type                   :string
#  uid                    :string
#  unconfirmed_email      :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_type                  (type)
#
class Instructor < User
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  index_name [Rails.env, Rails.application.class.module_parent_name.underscore, self.name.downcase].join('_')

  has_many :trips, foreign_key: :instructor_id
  has_one :vehicle, foreign_key: :instructor_id

  accepts_nested_attributes_for :trips, allow_destroy: true
  accepts_nested_attributes_for :vehicle, allow_destroy: true
  # , inverse_of: :user
  settings do
    mapping dynamic: :false do
      indexes :id, type: :long
      indexes :avatar_url, type: :text
      indexes :email, type: :text
      indexes :full_name, type: :text
      indexes :username, type: :text
      indexes :created_at, type: :date
      indexes :vehicle, type: :object do
        indexes :id, type: :long
        indexes :instructor_id, type: :long
        indexes :brand, type: :text
        indexes :created_at, type: :date
      end
    end
  end


  def as_indexed_json(options = {})
    self.as_json(
        only: [:id, :avatar_url, :email, :full_name, :username, :created_at],
        include: {vehicle: {only: [:id, :instructor_id, :brand, :created_at]}}
    )
  end

  before_save :force_index

  def force_index
    if changes['vehicle_id']
      attr = :@__changed_model_attributes
      old_changes = __elasticsearch__.instance_variable_get(attr)
      __elasticsearch__.instance_variable_set(attr, old_changes.merge!('vehicle' => true))
    end
  end


  def self.update_vehicle(vehicle, options ={})
    options[:index] ||= index_name
    options[:wait_for_completion] ||= false
    options[:body] = {
        conflicts: :proceed,
        query: {
            match: {
                'vehicle.id': vehicle.id
            }
        },
        script: {
            lang: :painless,
            source: 'ctx._source.vehicle.brand = params.vehicle.brand',
            params: {vehicle: {brand: vehicle.brand}}
        }
    }
    __elasticsearch__.client.update_by_query(options)
  end
end
