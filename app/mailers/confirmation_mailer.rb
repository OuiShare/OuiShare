class ConfirmationMailer < ActionMailer::Base
  layout 'email'
  default from: 'no-reply@ouishare.net'

  def confirmation(params)
    mail(to: current_user.email, from: 'no-reply@ouishare.net', subject: "[OuiShare contact] #{@params[:subject]}")
  end
end
