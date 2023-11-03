# This file is used by Rack-based servers to start the application.

require_relative "config/environment"
require_relative "./app/api/v1/api"

Appsignal.config = Appsignal::Config.new(
  File.expand_path("../", __FILE__), # The root of your app
  "development" # The environment of your app (development/production)
)

Appsignal.start_logger
Appsignal.start

run Rails.application
Rails.application.load_server
