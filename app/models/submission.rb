class Submission < ApplicationRecord
  enum kind: {
    manual_sampling_cost: 10,
    tanks_increased_turnover_potential: 20
  }

  enum state: {
    pending: 0,
    parsed: 10,
    sent: 20,
    done: 30
  }

  def name
    "#{created_at} - #{state} - #{kind.camelize}"
  end
end
