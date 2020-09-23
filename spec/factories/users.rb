FactoryBot.define do
  factory :user do
    nickname { 'testuser' }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { 'password' }
    admin { false }
  end
end
