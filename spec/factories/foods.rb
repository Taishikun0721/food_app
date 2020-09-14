FactoryBot.define do
  factory :food do
    description { 'This is my text' }
    user
    category
  end
end
