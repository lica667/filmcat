class HomeController < ApplicationController
  def index  
  	 @videos = Video.all.order(:name)
     #@videos = Video.all.order(:rating).reverse if params[:id] == 'rating'
     @genres = Genre.all.order(:genre)
  end

  def name
  	@videos = Video.all.order(:name)
  	redirect_to root_path
  end

  def rating
  	@videos = Video.all.order(:rating)
  	redirect_to root_path
  end

  def release_date
  	@videos = Video.all.order(:release_date)
  	redirect_to root_path
  end
end

