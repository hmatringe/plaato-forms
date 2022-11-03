# frozen_string_literal: true

module Plaato
  class Service
    def self.call(**args)
      ShopifyApiClient.invoke_shopify_api { new(args).call }
    end

    def initialize(**args)
      raise NotImplementedError
    end

    def call
      raise NotImplementedError
    end

    private

    def log(str)
      Rails.logger.info str
    end
  end
end
