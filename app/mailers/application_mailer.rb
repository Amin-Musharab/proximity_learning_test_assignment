class ApplicationMailer < ActionMailer::Base
  default from: "from@localhost"
  layout "mailer"
end
