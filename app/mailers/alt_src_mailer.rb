class AltSrcMailer < ApplicationMailer
  def alt_src_email(case_number)
    @this_case = case_number.to_i
    mail(to: "p3dguides@gmail.com",
      subject: 'P3D Files Received',
      template_path: 'alt_src_mailer',
      template_name: 'alt_src_email'
    )
  end
end
