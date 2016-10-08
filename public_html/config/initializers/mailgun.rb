#require File.expand_path('../application', __FILE__)
#require_relative 'application_settings'
Rails.application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address   => "smtp.mailgun.org",
    :port      => 587, # 2525
    :user_name => Settings.mailgun.username,
    :password  => Settings.mailgun.password
  }
end
