# frozen_string_literal: true

# reload!; Plaato::ProcessSubmission.call(submission: Submission.last)
module Plaato
  class ProcessSubmission < Service
    def initialize(submission:)
      @submission = submission
    end

    def call
      result = upsert_hubspot_contact
      success = Date.parse(result.updatedAt) == Time.zone.today
      success ? @submission.done! : @submission.failed!
      @submission.state
    end

    private


    def upsert_hubspot_contact
      Plaato::Hubspot::Contacts::Upsert.call(
        email: @submission.email,
        properties: @submission.properties
      )
    end
  end
end
