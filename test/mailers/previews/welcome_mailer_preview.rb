# Preview all emails at http://localhost:3000/rails/mailers/welcome_mailer
class WelcomeMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/welcome_mailer/send_grettings_notification
  def send_grettings_notification
    WelcomeMailer.send_grettings_notification
  end

end
