class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :premiere_check!

  def premiere_check
  	@videos = Video.where(release_date: Date.today)
  	@videos.each do |video|
  		@email = User.find(PremiereVideo.last.user_id).email
      #send email
  	end
  end
  
end
