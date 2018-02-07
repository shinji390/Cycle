class Users::RegistrationsController < Devise::RegistrationsController
layout 'application'

before_action :authenticate_user!

protected

def update_resource(resource, params)
  resource.update_without_current_password(params)
end

def after_update_path_for(resource)
  user_path(resource)
end

end
