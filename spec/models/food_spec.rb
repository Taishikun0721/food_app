require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:user_a) { FactoryBot.create(:user) }
  let(:category_a) { FactoryBot.create(:category) }
  let(:food_a) { FactoryBot.build(:food, user: user_a, category: category_a) }

  describe 'must exists' do

    before do
      food_a.image = fixture_file_upload('spec/factories/images/after.png')
    end

    it 'valid data' do
      food_a.valid?
      expect(food_a).to be_valid
    end
  end
end
