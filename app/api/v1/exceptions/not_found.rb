# frozen_string_literal: true

module V1
  module Exceptions
    class NotFound < BaseError
      def initialize(message: nil)
        puts "herrrrr"
        super(
          status: 404,
          message: message || "Oops, we could not find the record you are looking for."
        )
      end
    end
  end
end
