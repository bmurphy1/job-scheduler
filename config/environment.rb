# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
TaskServer::Application.initialize!

require 'sidekiq'
require 'redis'