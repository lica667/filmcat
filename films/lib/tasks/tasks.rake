desc "check films for premiere"
task :check => :environment do
	puts "checking for premieres..."

  @videos = Video.where(release_date: Date.today)
  @videos.each do |video|
  	@user_ids = PremiereVideo.where(video_id: video.id)
  	@user_ids.each do |uid|
  		@user = User.find(uid)
  		puts "sending email..."
  		UserMailer.email(@user).deliver
  		#PremiereVideo.where(user_id: uid , video_id: video.id).destroy
  	end  		
  end
end