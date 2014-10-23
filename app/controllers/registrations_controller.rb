class RegistrationsController < Devise::RegistrationsController

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:fname, :email, :password, :password_confirmation)}
  end
  
  def new
    super
  end

  def create
    super
  end

  protected

  def after_sign_up_path_for(resource)
    ConfirmationMailer.confirmation(current_user).deliver!
    donations_path(sign_up: 'yes')
  end

  def donate
    @donation_page = @current_language.donation_page || DonationPage.new
    @testimonial = @current_language.testimonial || Testimonial.new
  end

  def pay
    if params['value'] == 'custom'
      params['value'] = params['amount']
    end
    Paypal.sandbox! if ENV['PAYPAL_SANDBOX'] == 'true' || Rails.env.development?
    donation = Donation.new
    payment = Payment.new(params['value'].to_i, params['currency'])
    payment.setup!(
      payments_success_callback_url,
      payments_cancel_callback_url
    )
    donation.payment_token = payment.token
    donation.value = params['value'].to_i
    donation.currency = params['currency']
    donation.save

    redirect_to payment.redirect_uri
  end

  def thank_you
  end
end