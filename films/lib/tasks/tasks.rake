desc "check films for premiere"
task :check => :environment do
	puts "checking for premieres..."

  @videos = Video.where(release_date: Date.today)
  @videos.each do |video|
  	@premieres = PremiereVideo.where(video_id: video.id)
  	@premieres.each do |premiere|
  		@user = User.find(premiere.user_id)
  		puts "sending email..."
  		UserMailer.email(@user).deliver
      puts "sent for #{@user.email}"
  		premiere.destroy
  	end  		
  end
end