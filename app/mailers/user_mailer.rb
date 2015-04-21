class UserMailer < ApplicationMailer
  default from: "ryanimmesberger@gmail.com"

  def notify_email(user)
    @user = user

    @url = 'http://localhost:3000'
    mail(to: @user.email, subject: 'Your talent offer has been accepted')
  end


end
