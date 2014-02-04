class ContactMailer < ActionMailer::Base
  layout 'email'
  default from: 'no-reply@ouishare.net'

  def contact(params)
    @params = params[:contact]
    mail(to: @params[:to], from: @params[:email], subject: "[OuiShare contact] #{@params[:subject]}")
  end
end
