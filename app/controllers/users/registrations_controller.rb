# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController


  before_action :configure_permitted_parameters, if: :devise_controller?

  # @route POST /users (user_registration)
  # def create
  #   params[:user] = params[:user]&.merge(type: 'Rider')
  #   super
  # end



  # before_action :configure_account_update_params, only: [:update]

  # def new
  #   super
  # end

  # def create
  #   params[:user] = params[:user]&.merge(type: 'Rider')
  #   super
  # end

  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # def destroy
  #   super
  # end

  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  def update_resource(resource, params)
    if resource.provider == 'google_oauth2'
      params.delete('current_password')
      resource.password = params['password']

      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :type)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :full_name, :avatar_url_pic, :email, :password, :current_password)}
  end


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: $i[type])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
