class FeedbackMailer < ApplicationMailer
  default to: Admin.pluck('email')

  def feedback_mailer(feedback)
    @email = feedback.email
    @message = feedback.message
  end
end