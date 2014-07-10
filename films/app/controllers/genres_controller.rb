class GenresController < ApplicationController
  def show
  	@genre = Genre.find(params[:id])
    @videos = @genre.videos
    if params[:sort] == 'name_asc'
      @videos = @videos.order(:name)
    elsif params[:sort] == 'rating_asc'
      @videos = @videos.order(:rating)
    elsif params[:sort] == 'release_date_asc'
      @videos = @videos.order(:release_date) 
    elsif params[:sort] == 'name_desc'
      @videos = @videos.order(:name).reverse
    elsif params[:sort] == 'rating_desc'
      @videos = @videos.order(:rating).reverse
    elsif params[:sort] == 'release_date_desc'
      @videos = @videos.order(:release_date).reverse      
    else
      @videos
    end
  end
end
