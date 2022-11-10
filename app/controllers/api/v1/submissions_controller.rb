# frozen_string_literal: true

module Api
  module V1
    class SubmissionsController < ActionController::API
      def create
        submission = Submission.create submission_params
        # TODO: move to async job to leverage sidekiq retry mechanism
        # and reply quicker (hence display results quicker)
        Plaato::ProcessSubmission.call(submission: submission)
        render json: { submission: :created }, status: 201
      end

      private

      def submission_params
        params.require(:submission).permit!
      end
    end
  end
end
