require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:user_a) { FactoryBot.create(:user) }
  let(:category_a) { FactoryBot.create(:category) }
  let(:food_a) { FactoryBot.create(:food, user: user_a, category: category_a) }

  xdescribe 'must exists' do

  end
end
