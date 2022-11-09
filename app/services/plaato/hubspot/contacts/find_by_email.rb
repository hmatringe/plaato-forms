# frozen_string_literal: true

# reload!;Plaato::Hubspot::Contacts::FindByEmail.call(email: "toto@gmail.com")
module Plaato
  module Hubspot
    module Contacts
      class FindByEmail < ContactBase
        def call
          puts "seaching contact with email #{@email}"

          uri = URI(url)
          http = Net::HTTP.new(uri.host, uri.port)
          http.use_ssl = true
          request = Net::HTTP::Post.new(uri.path, headers)
          request.body = body.to_json
          response = http.request(request)
          raise ApiClientError unless response.code.to_i == 200

          search_results = HashToStruct.struct(JSON.parse(response.body))
          HashToStruct.struct(search_results.results.first) if search_results.total == 1
        end

        private

        def url
          'https://api.hubapi.com/crm/v3/objects/contacts/search'
        end

        def body
          {
            "filterGroups" => [
              {"filters" => [
                {
                  "propertyName": "email",
                  "operator": "EQ",
                  "value": @email
                }
              ]
            }
          ]
        }
        end
      end
    end
  end
end
