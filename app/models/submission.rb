class Submission < ApplicationRecord
  enum kind: {
    pending: 0,
    parsed: 10,
    sent: 20,
    done: 30
  }
end
