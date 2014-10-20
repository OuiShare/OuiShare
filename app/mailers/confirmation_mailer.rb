class ConfirmationMailer < ActionMailer::Base
  layout 'email'
  default from: 'no-reply@ouishare.net'

  def confirmation(params)
    current_user = params
    attachments.inline['ouishare-email.png'] = File.read(File.join(Rails.root, 'app','assets','images','ouishare-email.png'))
    mail(to: current_user.email, from: 'no-reply@ouishare.net', subject: "[OuiShare contact] Welcome to the OuiShare community!")
  end
end
