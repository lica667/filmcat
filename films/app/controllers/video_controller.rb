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
    @video_join = VideoJoin.where(user_id: current_user.id, video_id: params[:id]).first    
    if @video_join.nil?
      @video_join = VideoJoin.new 
    else
      @video_join.favorite = true
    end
  end

  def like
    @film = Film.find(params.require(:film).permit[:id])
    @film.rating += 1
    @film.save
    redirect_to video_path(@film.id)
  end

  def favorite
    @film_join = VideoJoin.create(params.require(:video_join).permit([:user_id, :video_id]))
    redirect_to video_path(@film_join.video_id)
  end
end
