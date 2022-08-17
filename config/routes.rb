Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations',
      confirmations: 'users/confirmations'
      
    }
  
  root 'home#welcome' 
  get 'search',to: "after_admin_signin#search"
  get '/vehicle', to: "after_admin_signin#vehicles"
  get '/confirmation_pending' => 'home#after_registration_path'
  resources :after_user_signin
  resources :after_admin_signin

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
