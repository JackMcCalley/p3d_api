class CaseSubmittedMailerPreview < ActionMailer::Preview
  def case_submitted_mail_preview
    @case = Rxform.where(case: params[:case])
    CaseSubmittedMailer.case_submitted_email(case)
  end
end
