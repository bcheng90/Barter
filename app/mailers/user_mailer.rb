class UserMailer < ApplicationMailer
  default from: "ryanimmesberger@gmail.com"

  def notify_email(user)
    @user = user

    @url = 'http://localhost:3000'
    mail(to: @user.email, subject: 'You created an account at Barter!')
  end

  def mail_offer(sender, reciever, timeslot)
    @sender = sender
    @reciever = reciever
    @timeslot = timeslot
    @url = 'http://localhost:3000'
    mail(to: @reciever.email, subject: 'Someone has offered you their talent!')
  end

  def accept_offer(sender, reciever, timeslot)
    @sender = sender
    @reciever = reciever
    @timeslot = timeslot
    @url = 'http://localhost:3000'
    mail(to: @reciever.email, subject: "#{@sender.username} has accepted your offer!")
  end

  def decline_offer
  end

end
