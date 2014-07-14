class LocalesController < ApplicationController

	def index  
	  if current_user
	    current_user.locale = params[:locale] # change my locality
	    current_user.save
	  end        
	  session[:locale] = params[:locale]               
	  redirect_to root_path
	end   
end
