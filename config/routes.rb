# == Route Map
#

Rails.application.routes.draw do
  get 'trips/new'
  get 'trips/create'
  get 'trips/update'
  get 'trips/edit'
  get 'trips/destroy'
  get 'trips/show'
  get 'trips/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :users do
    get :instructor_booking,
        # on: :member,
        to: 'trips#new', constraints: InstructorBookingConstraint.new
  end

  root 'pages#home'
  get '/instructors', to: 'pages#instructors'

  get '/users/sign_in', to: redirect('/users/sign_up')

  devise_for :users, controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks',
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }

  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # default_url_options :host => "localhost"

  # Defines the root path route ("/")
  # root "articles#index"

end
