Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations',
      confirmations: 'users/confirmations'
      
    }
  
  root 'home#welcome'
  # get '/after_admin_signin', to: 'after_admin_signin#after_admin_signin'
  get '/delete/bnm/:id', to: 'after_admin_signin#delete', as: :delete
  # get '/vehicle_details', to: "home#vehicle_details", as: :vehicle_details
  # get '/after_user_signin', to: 'after_user_signin#after_user_signin'
  # post '/new', to: 'after_user_signin#new'
  get '/confirmation_pending' => 'home#after_registration_path'
  

  resources :after_user_signin
  resources :after_admin_signin

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
