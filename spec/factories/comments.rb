FactoryBot.define do
  factory :comment do
    body { "This is a comment" }
    user
    food
  end
end
