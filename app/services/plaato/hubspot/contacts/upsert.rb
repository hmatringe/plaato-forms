# frozen_string_literal: true

# reload!; Plaato::Hubspot::Contacts::Upsert.call(
#   email: "toto1@gmail.com",
#   properties: {
#     roi_weekly_manual_sampling_per_fermenter: 'roi_weekly_manual_sampling_per_fermenter_value',
#     roi_per_samples_liquid_tapped_volume: 'roi_per_samples_liquid_tapped_volume_value',
#     roi_salary_per_hour: 'roi_salary_per_hour_value'
#   }
# )

module Plaato
  module Hubspot
    module Contacts
      class Upsert < ContactBase
        def initialize(email:, properties:)
          @email = email
          @properties = properties
        end

        def call
          contact_id = existing_contact&.id

          contact_id = new_contact&.id unless contact_id

          Update.call(
            contact_id: contact_id,
            properties: @properties
          )
        end

        private

        def existing_contact
          FindByEmail.call email: @email
        end

        def new_contact
          Create.call email: @email
        end
      end
    end
  end
end
