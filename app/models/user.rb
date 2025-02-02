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

class User < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks unless :skip_elasticsearch_callbacks
  index_name [Rails.env, Rails.application.class.module_parent_name.underscore, self.name.downcase].join('_')

  self.inheritance_column = :type

  rolify
  include Gravtastic
  gravtastic

  has_one_attached :avatar_url_pic

  validates :avatar_url_pic, content_type: [:png, :jpg, :jpeg]

  has_many :rider_users, foreign_key: :rider_id, class_name: 'Trip'
  has_many :instructors, through: :rider_users

  has_many :instructor_users, foreign_key: :instructor_id, class_name: 'Trip'
  has_many :riders, through: :instructor_users

  scope :instructors, -> {where(type: 'Instructor')}
  scope :riders, -> {where(type: 'Rider')}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :confirmable, :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, omniauth_providers: [:google_oauth2]

  # validates :username, length: {minimum: 3, maximum: 10}, allow_blank: false

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.full_name = auth.info.name # assuming the user model has a name
      user.avatar_url = defined? auth.info.image  # ? auth.info.image : current_user.gravatar_url # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      user.skip_confirmation!
    end
  end

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:Rider) if self.roles.blank?
  end

  accepts_nested_attributes_for :roles, allow_destroy: true

  settings do
    mapping dynamic: :false do
      indexes :id, type: :long
      indexes :email, type: :text
      indexes :username, type: :text
      indexes :full_name, type: :text
      indexes :type, type: :text
      indexes :latitude, type: :float
      indexes :longitude, type: :float
      indexes :provider, type: :text
      indexes :created_at, type: :date
    end
  end

  def as_indexed_json(options = {})
    self.as_json(
        only: [:id, :email, :username, :full_name, :latitude,
    :longitude, :provider, :created_at , :type
        ]
    )
  end
end


