# frozen_string_literal: true

class Relationship < ApplicationRecord
  enum :status, { pending: 0, accepted: 1 }

  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
end
