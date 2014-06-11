class VideoController < ApplicationController
  def new
  	@video = Video.new()
  end

  def create
  	@video = Video.new(params.require(:video).permit([:name, :description, :url_img, :url_video, :release_date]))
  	@video.save
  	redirect_to root_path
  end

  def show
  	@film = Video.find(params[:id])
  	@comment = Comment.new()
  end
end
