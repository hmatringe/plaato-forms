# frozen_string_literal: true

module Plaato
  module Hubspot
    module Contacts
      class ContactBase < Base
        def initialize(email:)
          @email = email
        end

        private

        def url
          raise NotImplementedError
        end

        def body
          raise NotImplementedError
        end
      end
    end
  end
end
