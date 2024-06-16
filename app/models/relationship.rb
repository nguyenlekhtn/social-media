class Relationship < ApplicationRecord
  enum :status, { pending: 0, accepted: 1 }

  belongs_to :requester, class_name: 'User'
  belongs_to :requested_user, class_name: 'User'

  validates :requester, uniqueness: { scope: :requested_user } # rubocop:disable Rails/UniqueValidationWithoutIndex
end
