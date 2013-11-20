class ApplicationController < ActionController::Base
  	# Prevent CSRF attacks by raising an exception.
  	# For APIs, you may want to use :null_session instead.
  	protect_from_forgery with: :exception

  	protected

	def devise_parameter_sanitizer
		if resource_class == User
			User::ParameterSanitizer.new(User, :user, params)
		else
			super # Use the default one
		end
	end
end

class User::ParameterSanitizer < Devise::ParameterSanitizer
  def sign_in
    default_params.permit(:email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :profile_name)
  end

  def sign_up
    default_params.permit(:email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :profile_name)
  end

  def edit
    default_params.permit(:email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :profile_name)
  end
end

