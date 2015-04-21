# Load the Rails application.
require File.expand_path('../application', __FILE__)
require 'mailgun'
# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'e18861b0857c5390773296985b88851b',
  :password => 'e18861b0857c5390773296985b88851b',
  :domain => 'mailgun.org',
  :address => 'smtp.mailgun.org',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
