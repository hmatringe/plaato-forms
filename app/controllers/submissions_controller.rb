# frozen_string_literal: true

class SubmissionsController < ApplicationController
  def index
    @submissions = Submission.order(created_at: :desc)
  end
end
