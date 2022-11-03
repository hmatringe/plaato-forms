# frozen_string_literal: true

class Shop < ActiveRecord::Base
  include ShopifyApp::ShopSessionStorageWithScopes

  def self.main
    find_by shopify_domain: ENV['SHOPIFY_DOMAIN']
  end

  def api_version
    ShopifyApp.configuration.api_version
  end
end
