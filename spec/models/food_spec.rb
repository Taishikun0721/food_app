require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:user_a) { FactoryBot.create(:user) }
  let(:category_a) { FactoryBot.create(:category) }
  let(:food_a) { FactoryBot.build(:food, user: user_a, category: category_a) }

  describe 'validation test' do

    context 'with image' do
      before do
        food_a.image = fixture_file_upload('spec/factories/images/after.png')
      end

      it 'be able to make valid data' do
        food_a.valid?
        expect(food_a).to be_valid
      end
    end

    context 'without image' do
      it 'invalid without image' do
        food_a.tap(&:save).valid?
        expect(food_a.errors[:image]).to include '画像を添付して下さい。'
      end
    end
  end
end
