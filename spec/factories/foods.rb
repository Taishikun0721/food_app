FactoryBot.define do
  factory :food do
    description { 'This is my text' }
    after(:build) do |food|
      food.image { fixture_file_upload(Rails.root, 'spec/factories/images/after.png') }
    end
    user
    category
  end
end
