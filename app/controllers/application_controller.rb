class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
  	return '/dashboard' if current_user.present? && !current_user.nil?
  end

  def auth_user
	redirect_to sign_in_url unless user_signed_in?
  end

end
