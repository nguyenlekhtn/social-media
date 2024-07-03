FactoryBot.define do
  sequence(:email) { |n| "person#{n}@example.com" }

  factory :user do
    email
    password { 'password123' }
  end
end
