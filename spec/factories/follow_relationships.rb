FactoryBot.define do
  factory :follow_relationship do
    requester factory: %i[user]
    requested_user factory: %i[user]
  end
end
