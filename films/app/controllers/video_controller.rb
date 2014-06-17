class VideoController < ApplicationController
  def new
  	@video = Video.new()
  end

  def create
  	@video = Video.new(params.require(:video).permit([:name, :description, :url_img, :url_video, :release_date]))
    @video.rating = 0
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

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to root_path
  end

  def update
    @video = Video.find(params[:id])
    @video.update_attributes(params.require(:video).permit([:name, :description, :url_img, :url_video, :release_date]))
    redirect_to video_path(@video)
  end

  def edit
    @video = Video.find(params[:id])
  end

  def like
    @film = Video.find(params[:id])
    @film.rating += 1
    @film.save
    redirect_to video_path(@film.id)
  end

  def favorite
    #@video_join.favorite.nil?
       @film_join = VideoJoin.create(params.require(:video_join).permit([:user_id, :video_id]))
       #@film_join.favorite = true
       #@film_join.save
    #end
    redirect_to video_path(@film_join.video_id)
  end

  def watched
    @videos = current_user.videos
  end
end
