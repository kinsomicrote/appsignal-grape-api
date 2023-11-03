# frozen_string_literal: true

module V1
  module Exceptions
    class BadRequest < StandardError
      def initialize(error: nil)
        @error = error || "Please check your request"
      end

      def body
        @error
      end
    end
  end
end
