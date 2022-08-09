class WelcomeMailer < ApplicationMailer

  def send_grettings_notification(user)
    @user = user

    mail to: @user.email, subject: " Thank you for sigining up on our site"
  end
end
