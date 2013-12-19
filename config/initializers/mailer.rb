begin
  unless Rails.env.test?
    ActionMailer::Base.smtp_settings = {
    address: 'smtp.sendgrid.net',
    port: '587',
    authentication: :plain,
    user_name: ENV['SENDGRID_USERNAME'],
    password: ENV['SENDGRID_PASSWORD'],
    domain: ENV['sendgrid_domain'],
    :enable_starttls_auto => true

    }
    ActionMailer::Base.delivery_method = :smtp
  end
  ActionMailer::Base.default_url_options = { host: Settings.mailer[:default_url_host] }
rescue
  nil
end
