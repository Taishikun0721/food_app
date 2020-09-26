require 'rails_helper'

RSpec.describe "FoodsApis", type: :request do

  let(:user_a) { create(:user) }
  let(:category_a) { create(:category) }
  let(:food_a) { build(:food) }

  describe '#index' do
    context 'as authenticated user' do
      it 'works to foods_path' do
        get foods_path
        expect(response).to have_http_status '200'
      end
    end

    context 'as unauthenticated user' do
      xit 'redirect to login_path (on the way)' do
        get foods_path
        expect(response).to redirect_to login_path
      end
    end
  end

  describe '#new' do
    context 'as authenticated user' do
      xit 'works to new_foods_path (on the way)' do
        get new_food_path
        expect(response).to have_http_status '200'
      end
    end

    context 'as unauthenticated user' do
      xit 'redirect to login_path (on the way)' do
        get new_food_path
        expect(response).to redirect_to login_path
      end
    end
  end

  describe '#show' do
    context 'as authenticated user' do
      it 'works to food_path' do
        get foods_path(food_a)
        expect(response).to have_http_status '200'
      end
    end
  end
end
