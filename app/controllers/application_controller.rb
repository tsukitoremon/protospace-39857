class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!, except: [:show, :index]
    
    private
     def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :user_name, :user_profile, :user_affiliation, :user_position])
     end
   end
