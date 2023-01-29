# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  address                :text
#  avatar_url             :string
#  avatar_url_pic         :string
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  full_name              :string
#  latitude               :float
#  longitude              :float
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  type                   :string           default("Rider")
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

  scope :filter_by_instructor_vehicle, -> (search_params) {
    search("#{search_params}").response.hits.hits.map{|r| r._source}
  }

  def vehicle_brand_name(vehicle_brand_id)
    VehicleBrand.find_by_id(vehicle_brand_id).vehicle_brand_name.to_s
  end

  def vehicle_model_name(vehicle_model_id)
    VehicleModel.find_by_id(vehicle_model_id).vehicle_model_name.to_s
  end

  settings do
    mapping dynamic: :false do
      indexes :id, type: :long
      indexes :email, type: :text
      indexes :provider, type: :date
      indexes :full_name, type: :text
      indexes :username, type: :text
      indexes :type, type: :text
      indexes :latitude, type: :float
      indexes :longitude, type: :float
      indexes :created_at, type: :date
      indexes :vehicle, type: :object do
        indexes :id, type: :long
        indexes :created_at, type: :date
        indexes :instructor_id, type: :long
        indexes :vehicle_models_id, type: :long
        indexes :vehicle_brands_id, type: :long
        indexes :vehicle_type, type: :text
        indexes :transmission_type, type: :text
        indexes :control_type, type: :text
        indexes :vehicle_number_plate, type: :text
      end
    end
  end


  def as_indexed_json(options = {})
    self.as_json(
        only: [:id, :email, :username, :full_name, :type, :latitude,
               :longitude, :provider, :created_at],
        include: {vehicle: {only: [:id, :instructor_id, :vehicle_models_id, :vehicle_brands_id,
                                   :vehicle_type, :transmission_type, :control_type,
                                   :vehicle_number_plate, :created_at]}}
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
            source: "ctx._source.vehicle.vehicle_brands_id = params.vehicle.vehicle_brands_id",
            params: {vehicle: {vehicle_brands_id: vehicle.vehicle_brands_id}}
        }
    }
    __elasticsearch__.client.update_by_query(options)
  end
end
