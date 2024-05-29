class Relationship < ApplicationRecord
  belongs_to :requester, class_name: 'User'
  belongs_to :requested_user, class_name: 'USer'

  validates :requester, uniqueness: { scope: :requested_user }
end
