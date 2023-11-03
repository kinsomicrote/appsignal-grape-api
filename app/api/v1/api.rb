# frozen_string_literal: true

# require "appsignal"
# require "appsignal/integrations/grape"
module V1
  class API < Grape::API
    include ExceptionsHandler
    insert_before Grape::Middleware::Error, Appsignal::Grape::Middleware

    # rescue_from ActiveRecord::RecordNotFound do |error|
    #   error!({ error: error.message }, 404, { 'Content-Type' => 'text/error' })
    # end
    #
    # rescue_from :all do |error|
    #   # Appsignal.set_error(error)
    #   error!({ error: error.message }, 500, { 'Content-Type' => 'text/error' })
    # end

    mount V1::Jobs
  end
end