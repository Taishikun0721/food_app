require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user_a) { FactoryBot.create(:user) }
  let(:user_b) { FactoryBot.create(:user, email: 'test1@example.com') }
  let!(:category_breakfast) { FactoryBot.create(:category, name: 'breakfast') }
  let!(:category_lunch) { FactoryBot.create(:category, name: 'lunch') }
  let!(:category_dinner) { FactoryBot.create(:category, name: 'dinner') }
  let(:food_a) { FactoryBot.build(:food) }
  let(:comment) { FactoryBot.create(:comment, food: food_a, user: user_a) }

  describe 'validation test' do
    context 'as owner' do
      before do
        food_a.image = fixture_file_upload('spec/factories/images/after.png')
      end

      it 'is not allowed without body' do
        comment.body = nil
        comment.valid?
        if I18n.locale == :en
          expect(comment.errors[:body]).to include "can't be blank"
        else
          expect(comment.errors[:body]).to include "を入力してください"
        end
      end
    end
  end
end
