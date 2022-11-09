# frozen_string_literal: true

# reload!; Plaato::Hubspot::Contacts::Update.call(
#   contact_id: 201,
#   properties: {
#     roi_weekly_manual_sampling_per_fermenter: 'roi_weekly_manual_sampling_per_fermenter_value',
#     roi_per_samples_liquid_tapped_volume: 'roi_per_samples_liquid_tapped_volume_value',
#     roi_salary_per_hour: 'roi_salary_per_hour_value'
#   }
# )

module Plaato
  module Hubspot
    module Contacts
      class Update < Base
        def initialize(contact_id:, properties:)
          @contact_id = contact_id
          @properties = properties
        end

        def call
          puts "updating contact with contactId #{@contact_id} with properties #{@properties}"

          uri = URI(url)
          http = Net::HTTP.new(uri.host, uri.port)
          http.use_ssl = true
          request = Net::HTTP::Patch.new(uri.path, headers)
          request.body = body.to_json
          response = http.request(request)
          raise ApiClientError unless response.code.to_i == 200

          HashToStruct.struct(JSON.parse(response.body))
        end

        private

        def url
          "https://api.hubapi.com/crm/v3/objects/contacts/#{@contact_id}"
        end

        def body
          {
            properties: @properties
          }
        end
      end
    end
  end
end
