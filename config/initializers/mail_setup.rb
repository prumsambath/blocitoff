if Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp;
  ActionMailer::Base.smtp_settings = {
    address:              'smtp.sendgrid.net',
    port:                 '587',
    authentication:       :plain,
    user_name:            ENV['sendgrid_username'],
    password:             ENV['sendgrid_password'],
    domain:               'heroku.com',
    enable_starttls_auth: true
  }
end
