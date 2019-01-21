class CaseSubmittedMailer < ApplicationMailer
  def case_submitted_email(case_number)
    @this_case = case_number.to_i
    this_rxform=Rxform.where(case: @this_case)
    user_id=this_rxform.pluck(:user_id)
    @user=User.find(user_id)
    mail(to: @user.pluck(:email),
      subject: 'P3D Guides Case Received',
      template_path: 'case_submitted_mailer',
      template_name: 'case_submitted_response'
    )
  end
end
