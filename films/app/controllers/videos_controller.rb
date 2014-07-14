class VideosController < ApplicationController
  def new
    if current_user and current_user.admin?
    	@video = Video.new()
      @video.genres.build
    else
      flash[:alert] = "You're not an admin! Get out!"
    end
  end

  def create
  	@video = Video.new(video_params)
    @video.rating = 0
  	@video.save
  	redirect_to root_path
  end

  def edit
    if current_user and current_user.admin?
      @video = Video.find(params[:id])
      @video.genres.build
    else
      flash[:alert] = "You're not an admin! Get out!"
    end
  end

  def update
    @video = Video.find(params[:id])    
    @video.update_attributes(video_params)
    redirect_to video_path(@video)
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to root_path
  end

  def show
  	@film = Video.find(params[:id])
  	@comment = Comment.new()

    if current_user
      @video_join = VideoJoin.where(user_id: current_user.id, video_id: params[:id]).first    
      if @video_join.nil?
        @video_join = VideoJoin.new
      else
        @video_join.favorite = true
      end
      @premiere_video = PremiereVideo.where(user_id: current_user.id, video_id: params[:id]).first    
      @premiere_video = PremiereVideo.new if @premiere_video.nil?
    end
  end

  def like
    @film = Video.find(params[:id])
    @like = Like.where(user_id: current_user.id, video_id: @film.id).first
    if @like.nil?
      @film.rating += 1
      Like.create(user_id: current_user.id, video_id: @film.id)      
    else
      flash[:alert] = 'You can rate one time'      
    end
    @film.save
    redirect_to video_path(@film.id)
  end

  def favorite
    @id = params.require(:video_join).permit([:video_id])
    @video_join = VideoJoin.where(user_id: current_user.id, video_id: params[:id]).first    
    if @video_join.nil?      
      @film_join = VideoJoin.create(params.require(:video_join).permit([:user_id, :video_id]))
    else      
      @video_join.destroy
    end
    redirect_to video_path(@id)
  end

  def watched

    @videos = current_user.videos
  end

  def premiere
    @premiere_video = PremiereVideo.where(user_id: current_user.id, video_id: params[:id]).first
    if @premiere_video.nil?
      PremiereVideo.create(params.require(:premiere_video).permit([:user_id, :video_id]))
    else
      @premiere_video.destroy
    end
    redirect_to video_path(params[:id])
  end

  def premiere_list
    @ids = PremiereVideo.where(user_id: current_user.id)
    @videos = Array.new
    @ids.each{|id| @videos.push(Video.find(id.video_id))}
  end

  private   

  def video_params
    params.require(:video).permit(:name, :description, :url_img, :url_video, :release_date, :image, :genre_ids => [])
  end
end
