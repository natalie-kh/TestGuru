class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.valid?
      FeedbackMailer.feedback_mailer(@feedback).deliver_now
      redirect_to welcome_index_path, notice: "Thank you for your message. We'll get back to you soon!"
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:message, :email)
  end
end
