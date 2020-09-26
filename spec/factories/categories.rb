FactoryBot.define do
  factory :category do
    name { 'breakfast' }

    trait :lunch do
      name { 'lunch' }
    end

    trait :dinner do
      name { 'dinner' }
    end
  end
end
