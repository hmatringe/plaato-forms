# frozen_string_literal: true

module Plaato
  class ShopifyApiClient
    def self.invoke_shopify_api
      ShopifyAPI::Auth::Session.temp(
        shop: shop.shopify_domain,
        access_token: shop.shopify_token
      ) { |session| yield }
    end

    private

    def self.shop
      @shop ||= Shop.main
    end
  end
end
