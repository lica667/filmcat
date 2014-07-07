class VideoController < ApplicationController
  def new
  	@video = Video.new()
    @genre_video = GenreVideo.new
  end

  def create
  	@video = Video.new(params.require(:video).permit([:name, :description, :url_img, :url_video, :release_date]))
    @video.rating = 0
    params.require(:genre).permit(:id).each do |genre|
      GenreVideo.create(:genre_id => genre, :video_id => @video.id)
    end
  	@video.save
  	redirect_to root_path
  end

  def show
  	@film = Video.find(params[:id])

  	@comment = Comment.new()

    @video_genre = @film.genres

    @video_join = VideoJoin.where(user_id: current_user.id, video_id: params[:id]).first    
    if @video_join.nil?
      @video_join = VideoJoin.new
    else
      @video_join.favorite = true
    end

    @premiere_video = PremiereVideo.where(user_id: current_user.id, video_id: params[:id]).first    
    @premiere_video = PremiereVideo.new if @premiere_video.nil?

  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to root_path
  end

  def update
    @video = Video.find(params[:id])
    
    @video.update_attributes(params.require(:video).permit([:name, :description, :url_img, :url_video, :release_date, :genre]))
    #@video.genres.update_attributes(params.require(:genre).permit(:id))
    #params.require(:genre).permit(:id).each do |id|
    #  @video.genres.create(:genre_id => id, :video_id => @video.id)
    #end
    redirect_to video_path(@video)
  end

  def edit
    @video = Video.find(params[:id])
    @genre_video = GenreVideo.new
  end

  def like
    @film = Video.find(params[:id])
    @film.rating += 1
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

  def genre
    @genre = Genre.find(params[:id])
    @videos = @genre.videos.all
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
  
end
