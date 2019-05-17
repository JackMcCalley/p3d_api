class ResetPasswordMailer < ApplicationMailer
  def reset_password_email(email, token)
    @user = User.find_by(email: email)
    @url = "http://localhost:3001/reset-password/?params=#{token}"
    mail(
      to: email + '.com',
      subject: "P3D Guides Password Reset",
      template_path: 'reset_password_mailer',
      template_name: 'reset_password_email',
    )
  end
end
