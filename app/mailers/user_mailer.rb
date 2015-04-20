class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout 'mailer'
end

class UserMailer < ApplicationMailer
  default from: "ryanimmesberger@gmail.com"

  def notify_email(user)
    @user = user
    @url = 'http://localhost:3000'
    mail(to: @user.email, subject: 'Your talent offer has been accepted')
  end


end
