# frozen_string_literal: true

class PolarisInlineErrorComponent < ViewComponent::Base
  def initialize(message:, id: nil)
    @message = message
    @id = id
  end
end
