if Rails.env.development? || Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.default_url_options = { host: 'http://letstalk-buddy.com' }
  ActionMailer::Base.smtp_settings = {
    authentication: :plain,
    address: "smtp.mailgun.org",
    port: 587,
    user_name: ENV['mailgun_username'],
    password: ENV['mailgun_password']
  }
end
