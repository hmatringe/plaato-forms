# frozen_string_literal: true

module Plaato
  module Hubspot
    class Base < Service
      class ApiClientError < StandardError; end
      def call
        raise NotImplementedError
      end

      private

      # def hubspot_api_client
      #   ::Hubspot::Client.new(access_token: token)
      #   Not using gem 'hubspot-api-client' because:
      #   ETHON: Libcurl initialized
      #   objc[19701]: +[__NSCFConstantString initialize] may have been in progress in another thread when fork() was called.
      #   We cannot safely call it or ignore it in the fork() child process. Crashing instead. Set a breakpoint on objc_initializeAfterForkError to debug.
      # end

      def token
        ENV["HUBSPOT_TOKEN"]
      end

      def headers
        {
          'Content-Type' => 'application/json',
          'authorization' => "Bearer #{token}"
        }
      end
    end
  end
end
