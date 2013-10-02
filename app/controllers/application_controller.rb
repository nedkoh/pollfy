class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #user authentication for everything
  before_filter :authenticate_user!
  #check authorization for resources with cancan except devise
  check_authorization :unless => :devise_controller?

before_filter do
  resource = controller_name.singularize.to_sym
  method = "#{resource}_params"
  params[resource] &&= send(method) if respond_to?(method, true)
end

  #if no access redirect home and show nice message
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  #handle when trying to retrieve something not existing (e.g. surveys/5555555/questions )
  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to root_url, :alert => exception.message
  end
end
