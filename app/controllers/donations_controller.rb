class DonationsController < ApplicationController
  def index
  end

  def pay
    if params['value'] == 'custom'
      params['value'] = params['amount']
    end
    Paypal.sandbox!
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
end
