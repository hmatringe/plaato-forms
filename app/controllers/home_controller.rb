# frozen_string_literal: true

class HomeController < ApplicationController
  include ShopifyApp::EmbeddedApp
  include ShopifyApp::RequireKnownShop
  include ShopifyApp::ShopAccessScopesVerification

  def index
    redirect_to submissions_path and return

    @shop_origin = current_shopify_domain
    @host = params[:host]
  end
end
