# frozen_string_literal: true

module Api
  module V1
    class BaseController < ActionController::API
      rescue_from ActiveRecord::RecordNotFound, with: :not_found

      private

      def verify_api_authorized
        raise ActionController::RoutingError, 'Not Found' unless params[:auth_token] == ENV['AUTH_TOKEN']
      end

      def not_found(exception)
        return render json: { error: exception.message }, status: :not_found if Rails.env.development?

        raise ActionController::RoutingError, 'Not Found'
      end

      def render_errors(errors)
        payload = Rails.env.development? ? { errors: errors } : {}
        render json: payload, status: :unprocessable_entity
      end
    end
  end
end
