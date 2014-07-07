class GenresController < ApplicationController
  def show
  	@genre = Genre.find(params[:id])
    @videos = @genre.videos
  end
end
