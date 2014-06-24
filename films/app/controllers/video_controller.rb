class VideoController < ApplicationController
  def new
  	@video = Video.new()
    @genres = Genre.all.order(:genre)
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
    @genres = Genre.all.order(:genre)
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to root_path
  end

  def update
    @video = Video.find(params[:id])
    @video.update_attributes(params.require(:video).permit([:name, :description, :url_img, :url_video, :release_date]))
    #params.require(:genre).permit(:id).each do |genre|
    #  @genre_video = GenreVideo.new()
    #  @genre_video[:genre_id] = genre
    #  @genre_video[:video_id] = @video.id
    #  @genre_video.save
    #end
    params.require(:genre).permit(:id).each do |id|
      GenreVideo.create(:genre_id => id, :video_id => @video.id)
    end
    redirect_to video_path(@video)
  end

  def edit
    @video = Video.find(params[:id])
    @genres = Genre.all.order(:genre)
    @genre_video = GenreVideo.new
  end

  def like
    @film = Video.find(params[:id])
    @film.rating += 1
    @film.save
    redirect_to video_path(@film.id)
  end

  def favorite
    @film_join = VideoJoin.create(params.require(:video_join).permit([:user_id, :video_id]))
    redirect_to video_path(@film_join.video_id)
  end

  def watched
    @videos = current_user.videos
    @genres = Genre.all.order(:genre)
  end

  def genre
    @genre = Genre.find(params[:id])
    @videos = @genre.videos.all
    @genres = Genre.all.order(:genre)
  end


end
