class UserMailer < ApplicationMailer
  default from: "ryanimmesberger@gmail.com"

  def notify_email(user)
    @user = user
    # mg_client = Mailgun::Client.new ENV['api_key']
    message_params = {:from    => ENV['gmail_username'],
                      :to      => @user.email,
                      :subject => 'Sample Mail using Mailgun API',
                      :text    => 'This mail is sent using Mailgun API via mailgun-ruby'}
                      p ENV['domain']
    # mg_client.send_message ENV['domain'], message_params

    @url = 'http://localhost:3000'
    mail(to: @user.email, subject: 'Your talent offer has been accepted')
  end


end
