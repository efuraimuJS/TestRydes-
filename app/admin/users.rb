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
#
ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :full_name, :uid, :avatar_url, :provider, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email
  #
  # or
  #
  permit_params do
    permitted = [:full_name, :uid, :avatar_url, :provider, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email, role_ids: []]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end

  index do
    selectable_column
    id_column
    column :full_name
    column :roles do |user| # user is every single instance of the User.rb Model.
      # table_for user.roles.order('name ASC') do
      #   column do |role|
      #     role.name
      #   end
      user.roles
    end
    actions
  end

  form do |f|
    f.inputs do # builds an input field for every attribute
      f.semantic_errors # shows errors on :base

      collected_data = Role.all
      f.input :roles, :as => :check_boxes, collection: collected_data
      # f.inputs
    end
    f.actions # adds the 'Submit' and 'Cancel' buttons
  end

  show do
    attributes_table do
      row :full_name
      row :roles
    end
  end

end
