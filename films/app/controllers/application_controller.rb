class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #before_action :authenticate_user!
  before_action :set_genres

  before_filter :set_locale  
  def set_locale
  	I18n.locale = (current_user.locale if current_user) || session[:locale] || I18n.default_locale
	end    
  
  protected

  def set_genres
    @genres = Genre.all
  end
  
end
