Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "welcome#index"

  #welcome controller
  get "welcome/aboutUs"
  get "welcome/contactUs"


  #login routes and resources
  resources :login
  
  #signup routes and resources
  resources :signup

  #user routes and resources
  resources :user
  #route for logging out
  get "user/logout"


  #post routes and resources
  resources :post
  
end
