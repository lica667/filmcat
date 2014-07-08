class UserMailer < ActionMailer::Base
  default from: "films@example.com"

  def email(user)
  	@user = user
  	@url  = 'http://0.0.0.0:3000/'
  	mail(to: @user.email, subject: 'Your film has already add to collection. See more in...')
  end

end
