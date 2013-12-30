class Payment
  attr_accessor :amount, :token, :payer_id, :redirect_uri, :identifier, :currency

  DESCRIPTION = {
    item: "OuiShare donation",
    payment: "OuiShare"
  }

  def initialize(amount = nil, currency = 'USD', custom_logger = nil)
    @amount = amount
    @currency = currency
    @logger = custom_logger || Rails.logger
  end

  def setup!(return_url, cancel_url, pay_client = nil)
    pay_client ||= client
    begin
      response = pay_client.setup(
        payment_request,
        return_url,
        cancel_url,
        pay_on_paypal: true,
        no_shipping: true
      )
    rescue Paypal::Exception::APIError => e
      raise e.response.inspect
      e.message # => 'PayPal API Error'
      e.response # => Paypal::Exception::APIError::Response
      e.response.details # => Array of Paypal::Exception::APIError::Response::Detail. This includes error details for each payment request.
      raise e.response.details
    end
    @token = response.token
    @logger.debug("Payment#setup! from #{pay_client.inspect}.")
    @redirect_uri = response.redirect_uri
    self
  end

  def complete!
    begin
      response = client.checkout!(token, payer_id, payment_request)
    rescue Paypal::Exception::APIError => e
        raise e.response.inspect
        e.message # => 'PayPal API Error'
        e.response # => Paypal::Exception::APIError::Response
        e.response.details # => Array of Paypal::Exception::APIError::Response::Detail. This includes error details for each payment request.
        raise e.response.details
    end

    self.payer_id = payer_id
    self.identifier = response.payment_info.first.transaction_id
  end

  private

  def client
    Paypal::Express::Request.new(PAYPAL_CONFIG)
  end

  def payment_request
    item = {
      name: DESCRIPTION[:item],
      #description: DESCRIPTION[:item],
      amount: amount,
      category: :Digital
    }

    request_attrs = {
      amount: amount,
      currency_code: currency,
      description: DESCRIPTION[:payment],
      items: [item]
    }

    Paypal::Payment::Request.new(request_attrs)
  end
end
