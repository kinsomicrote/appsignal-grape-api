# frozen_string_literal: true

module V1
  module Exceptions
    class BaseError < StandardError
      attr_reader :status, :message
      def initialize(message: nil, status: nil)
        @status = status || 500
        @message = message || "Something unexpected happened."
      end

      def body
        Rack::Response.new({ error: message }.to_json, status)
      end
    end
  end
end
