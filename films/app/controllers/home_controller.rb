class HomeController < ApplicationController
  def index  	
    if params[:sort] == 'name'
      @videos = Video.all.order(:name)
    elsif params[:sort] == 'rating'
      @videos = Video.all.unscoped.order(:rating).reverse
    elsif params[:sort] == 'release_date'
      @videos = Video.all.order(:release_date).reverse       
    else
      @videos = Video.all
    end
  end
end

