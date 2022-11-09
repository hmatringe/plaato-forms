# frozen_string_literal: true

module Plaato
  module Shopify
    class Base
      def self.call(**args)
        ShopifyApiClient.invoke_shopify_api { new(args).call }
      end
    end
  end
end
