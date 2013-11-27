class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # helper DeviseHelper
  before_filter :update_sanitized_params, if: :devise_controller?


  private 

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:profile_name, :name, :city_id, :email, :password, :password_confirmation)}
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def after_sign_in_path_for(resource)
    sign_in_url = url_for(:action => 'new', :controller => 'sessions', :only_path => false, :protocol => 'http')
    # if !current_user.profile_name
    #   redirect_to edit_user_path(current_user)
    # end
    if request.referer == sign_in_url
      super
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end
end
