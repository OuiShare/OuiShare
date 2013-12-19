begin
  unless Rails.env.test?
    ActionMailer::Base.smtp_settings = {
    address: 'smtp.sendgrid.net',
    port: '587',
    authentication: :plain,
    user_name: ENV['sendgrid_username'],
    password: ENV['sendgrid_password'],
    domain: ENV['sendgrid_domain']
    }
    ActionMailer::Base.delivery_method = :smtp
  end
  ActionMailer::Base.default_url_options = { host: Settings.mailer[:default_url_host] }
rescue
  nil
end
