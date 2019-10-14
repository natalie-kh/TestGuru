class Feedback
  include ActiveModel::Model

  attr_accessor :message, :email

  validates :message, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def headers
    {
        :subject => "Contact Form Inquiry",
        :to => "natalee.bogdanova@gmail.com",
        :from => %("#{current_user.email}">)
    }
  end
end