# frozen_string_literal: true

class Relationship < ApplicationRecord
  enum :status, { pending: 0, accepted: 1 }
end
