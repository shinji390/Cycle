class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    posts_path
  end

  def destroy_redirect
    path = Rails.application.routes.recognize_path(request.referer)
    if (path[:controller] == 'posts' && path[:action] == 'show')
      redirect_to posts_path
    else
      redirect_back(fallback_location: posts_path)
    end
  end

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :avatar, :avatar_cache ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :avatar, :profile, :avatar_cache, :remove_avatar ])
  end

end
