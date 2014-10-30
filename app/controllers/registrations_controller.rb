class RegistrationsController < Devise::RegistrationsController

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:fname, :email, :password, :password_confirmation)}
  end
  
  def new
    ids_userssource = [1,2,3,5,8,4,6]
    @sources = UserSource.all
    @sources.each {|sources| ids_userssource[sources.id] = sources}
    @user_sources = [UserSource.find(1).id,UserSource.find(2).id,UserSource.find(3).id,UserSource.find(5).id,UserSource.find(8).id,UserSource.find(4).id,UserSource.find(6).id].collect{ |id| ids_userssource[id] }
    @registration_page = @current_language.registration_page || RegistrationPage.new
    super
  end

  def create
    super
  end

  def update
    # For Rails 4
    account_update_params = devise_parameter_sanitizer.sanitize(:account_update)
    # For Rails 3
    # account_update_params = params[:user]

    # required for settings form to submit when password is left blank
    if account_update_params[:password].blank?
      account_update_params.delete("password")
      account_update_params.delete("password_confirmation")
    end

    @user = User.find(current_user.id)
    if @user.update_attributes(account_update_params)
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case their password changed
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
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