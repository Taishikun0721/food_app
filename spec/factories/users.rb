FactoryBot.define do
  factory :user do
    sequence(:nickname) { |n| "testuser#{n}" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { 'password' }
    admin { false }

    trait :admin do
      admin { true }
    end
  end
end
