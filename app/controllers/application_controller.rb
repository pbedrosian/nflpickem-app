class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name])
    end

  private

    def access?
      binding.pry
      if !(params[:user_id].to_i == current_user.id)
        redirect_to user_path(current_user)
      end
    end
    
end
