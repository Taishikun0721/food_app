require 'rails_helper'

RSpec.describe "FoodsApis", type: :request do

  let(:user_a) { FactoryBot.create(:user) }
  let(:category_a) { FactoryBot.create(:category) }
  let(:food_a) { FactoryBot.create(:food) }

  describe "GET" do
    it 'works to foods_path' do
      get foods_path
      expect(response).to have_http_status '200'
    end

    it 'works to new_foods_path' do
      get new_food_path
      expect(response).to have_http_status '200'
    end
  end

  describe 'POST' do

  end

end