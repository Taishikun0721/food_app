FactoryBot.define do
  factory :user do
    nickname { 'testuser' }
    email { 'test@example.com' }
    password { 'password' }
    admin { false }
  end
end
