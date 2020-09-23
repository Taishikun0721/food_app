FactoryBot.define do
  factory :food do
    sequence (:description) { |t| "This is my text #{t}" }
    user
    category
  end
end
