require 'paypal/express'

if Rails.env.development?
  PAYPAL_CONFIG =   {
    username:  'barboza.cardoso-facilitator_api1.gmail.com',
    password:  '1388354544',
    signature: 'ATPAo2XHgymj9wKSp2HrW.VVDzioAPNIHF0P4HAOQb5K78gon.T-qeDp',
    #sandbox:   true
  }
else
  PAYPAL_CONFIG =   {
    username:  ENV['PAYPAL_USERNAME'],
    password:  ENV['PAYPAL_PASSWORD'],
    signature: ENV['PAYPAL_SIGNATURE']
  }
end

#Paypal.sandbox! if PAYPAL_CONFIG[:sandbox]
