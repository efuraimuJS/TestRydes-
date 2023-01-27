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
class Rider < User
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  index_name [Rails.env, Rails.application.class.module_parent_name.underscore, self.name.downcase].join('_')

  has_many :trips, foreign_key: :rider_id

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
