Rails.application.routes.draw do
  devise_for :users , skip: [:registrations] 
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: 'users#login'

  get '/dashboard' => 'dashboard#index', :via => :get ,:as => :dashboard
  get '/login' => 'users#login', :via => :get, :as => :sign_in
  get '/register' => 'users#sign_up', :via => :get, :as => :sign_up
  match '/sign_in_user' => 'users#new_login_customer', :via => :post, :as => :new_login_customer
  match '/sign_up_user' => 'users#new_customer', :via => :post, :as => :new_customer
  get '/verification/:id' => 'users#verification', :via => :get, :as => :verification
  match '/email_confirmation/:id'=> 'users#email_confirmation',:via => [:patch, :put], :as => :email_confirmation
  get '/password-reset' => 'users#password_reset', :via => :get, :as => :password_reset
  match '/reset-password' => 'users#reset_password', :via => :post, :as => :reset_password
  get '/password-change/:token' => 'users#password_change', :via => :get, :as => :password_change
  match '/update-password/:token' => 'users#update_password_with_token', :via => [:post, :put], :as => :update_password_with_token

end
