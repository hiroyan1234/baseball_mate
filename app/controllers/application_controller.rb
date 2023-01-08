class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

  def configure_permitted_parameters
    added_attrs = [:last_name, :first_name, :last_name_kana, :first_name_kana, :sex, :age, :telephone_number, :is_deleted, :nickname, :introduction, :image, :password_confirmation]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end
  
end
