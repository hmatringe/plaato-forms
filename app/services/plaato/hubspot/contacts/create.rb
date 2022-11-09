# frozen_string_literal: true

# reload!;Plaato::Hubspot::Contacts::Create.call(email: "toto@gmail.com")

module Plaato
  module Hubspot
    module Contacts
      class Create < ContactBase
        def call
          puts "creating contact with email #{@email}"

          uri = URI(url)
          http = Net::HTTP.new(uri.host, uri.port)
          http.use_ssl = true
          request = Net::HTTP::Post.new(uri.path, headers)
          request.body = body.to_json
          response = http.request(request)
          raise ApiClientError unless response.code.to_i == 201

          HashToStruct.struct(JSON.parse(response.body))
        end

        private

        def url
          'https://api.hubapi.com/crm/v3/objects/contacts'
        end

        def body
          {
            properties: {
              email: @email
            }
          }
        end
      end
    end
  end
end
