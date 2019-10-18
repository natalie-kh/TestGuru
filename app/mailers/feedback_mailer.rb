class FeedbackMailer < ApplicationMailer
  def feedback_mailer(feedback)
    @email = feedback.email
    @message = feedback.message
    mail
  end
end
