class AltSourceDentistMailer < ApplicationMailer
  def alt_source_dentist_email(user)
    @user=User.find(user)
    mail(to: @user[:email],
      subject: 'P3D Files Received',
      template_path: 'alt_source_dentist_mailer',
      template_name: 'alt_source_dentist_email'
    )
  end
end
