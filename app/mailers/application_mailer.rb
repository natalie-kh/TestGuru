class ApplicationMailer < ActionMailer::Base
  default to: Proc.new { Admin.pluck(:email) },
          from: %('TestGuru' <mail@testguru.com>)
  layout 'mailer'
end
