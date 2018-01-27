class ApplicationController < ActionController::Base
 # Prevent CSRF attacks by raising an exception.
 # For APIs, you may want to use :null_session instead.
 protect_from_forgery with: :exception

 before_action :configure_permitted_parameters, if: :devise_controller?
 before_action :set_list

 protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
 end

 def set_list
   if user_signed_in?
     @current_list = current_user.lists.order('created_at').last
   end
 end

end
