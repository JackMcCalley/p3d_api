class AltSrcMailer < ApplicationMailer
  def alt_src_email(case_number)
    @this_case = case_number.to_i
    this_rxform=Rxform.where(case: @this_case)
    user_id=this_rxform.pluck(:user_id)
    @user=User.find(user_id)
    mail(to: "jackmccalley@gmail.com",
      subject: 'New P3D Guides Case Submitted',
      template_path: 'lab_mailer',
      template_name: 'lab_mailer'
    )
  end
end
