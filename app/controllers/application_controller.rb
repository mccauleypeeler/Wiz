class ApplicationController < ActionController::Base
  def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:number])

     devise_parameter_sanitizer.permit(:account_update, keys: [:number])
   end
   def home
   end
end
