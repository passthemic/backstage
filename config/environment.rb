# Load the rails application
require File.expand_path('../application', __FILE__)

#load heroku_env files for development
heroku_env = File.join(Rails.root, '/config/heroku_env.rb')
load(heroku_env) if File.exists?(heroku_env)

# Initialize the rails application
PtmBackstage::Application.initialize!
