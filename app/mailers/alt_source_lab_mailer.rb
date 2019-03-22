class AltSourceLabMailer < ApplicationMailer
  def alt_source_lab_email(user)
    @user=User.find(user)
    mail(to: @user[:email],
      subject: 'P3D Files Received',
      template_path: 'alt_source_lab_mailer',
      template_name: 'alt_source_lab_email'
    )
  end
end
