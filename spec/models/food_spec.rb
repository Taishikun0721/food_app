require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:user_a) { FactoryBot.create(:user) }
  let(:category_a) { FactoryBot.create(:category) }
  let(:food_a) { FactoryBot.create(:food, user: user_a, category: category_a) }

  context 'as authenticated user' do
    # it 'is succcessfully crated' do
    #   food_a.valid?
    #   expect(food_a).to be_valid
    # end
    #
    # Activestorageのテスト作成方法調査のため中断
  end
end
