class WelcomeMailer < ApplicationMailer
  def welcome_email(user_id)
    @user=User.find(user_id)
    mail(to @user.pluck(:email) + ".com",
    subject: "Welcome to P3D Guides!",
    template_path: 'welcome_mailer',
    template_name: 'welcome_email'
  )
  end
end
