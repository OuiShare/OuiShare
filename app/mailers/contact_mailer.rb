class ContactMailer < ActionMailer::Base
  layout 'email'
  default from: 'no-reply@ouishare.net'

  def contact(params)
    @params = params[:contact]
    mail(to: @params[:to], from: 'no-reply@ouishare.net', subject: "[OuiShare contact] #{@params[:subject]}")
  end
end
