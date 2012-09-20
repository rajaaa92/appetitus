# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Appetitush::Application.initialize!

Recaptcha.configure do |config|
    config.public_key  = '6LcuutYSAAAAAOLmpsEqqSraEVVzZ7na8JWAtADd'
    config.private_key = '6LcuutYSAAAAAHhcuLw6vGCyiA26zKxVcJIO2s8z'
  end
