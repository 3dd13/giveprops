class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # helper DeviseHelper
  before_filter :update_sanitized_params, if: :devise_controller?
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :profile_name, :gender, :city_id )
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :profile_name, :gender, :city_id, :current_password, :email, :password, :password_confirmation)
    end
  end

  private 

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:profile_name, :name, :city_id, :email, :password, :password_confirmation)}
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def after_sign_in_path_for(resource)
    sign_in_url = url_for(:action => 'new', :controller => 'sessions', :only_path => false, :protocol => 'http')
    if request.referer == sign_in_url
      super
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end
end
