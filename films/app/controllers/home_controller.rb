class HomeController < ApplicationController
  def index  	
    if params[:sort] == 'name_asc'
      @videos = Video.all.order(:name)
    elsif params[:sort] == 'rating_asc'
      @videos = Video.all.unscoped.order(:rating).reverse
    elsif params[:sort] == 'release_date_asc'
      @videos = Video.all.unscoped.order(:release_date).reverse 
    elsif params[:sort] == 'name_desc'
      @videos = Video.all.order(:name).reverse
    elsif params[:sort] == 'rating_desc'
      @videos = Video.all.unscoped.order(:rating)
    elsif params[:sort] == 'release_date_desc'
      @videos = Video.all.unscoped.order(:release_date)      
    else
      @videos = Video.all
    end
  end
end

