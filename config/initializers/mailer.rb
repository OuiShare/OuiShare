begin
  unless Rails.env.test?
    ActionMailer::Base.smtp_settings = {
      address: ENV['SMTP_ADDRESS'],
      port: '587',
      authentication: :plain,
      user_name: ENV['SMTP_USERNAME'],
      password: ENV['SMTP_PASSWORD'],
      domain: ENV['SMTP_DOMAIN'],
      :enable_starttls_auto => true
    }
    ActionMailer::Base.delivery_method = :smtp
  end
  ActionMailer::Base.default_url_options = { host: Settings.mailer[:default_url_host] }
rescue
  nil
end
