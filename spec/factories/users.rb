FactoryBot.define do
  factory :user do
    nickname { "MyString" }
    email { "MyString" }
    password_digest { "MyString" }
    admin { false }
  end
end
