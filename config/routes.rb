Rails.application.routes.draw do
  devise_for :users , skip: [:registrations] 
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: 'users#login'

  get '/dashboard' => 'dashboard#index', :via => :get ,:as => :dashboard
  get '/login' => 'users#login', :via => :get, :as => :sign_in
  get '/check_email' => 'users#check_email', :via => :get, :as => :check_email
  get '/register' => 'users#sign_up', :via => :get, :as => :sign_up
  match '/sign_in_user' => 'users#new_login_customer', :via => :post, :as => :new_login_customer
  match '/sign_up_user' => 'users#new_customer', :via => :post, :as => :new_customer
  get '/verification/:id' => 'users#verification', :via => :get, :as => :verification
  match '/email_confirmation/:id'=> 'users#email_confirmation',:via => [:patch, :put], :as => :email_confirmation
  match '/upload_image/:id'=> 'dashboard#upload_image',:via => [:patch, :put,:post], :as => :upload_image
  delete'/dashboard/remove_image/:id' => 'dashboard#remove_image', as: :remove_image
end
