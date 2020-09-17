require 'rails_helper'

RSpec.describe 'UsersApis', type: :request do
  let(:user_a) { FactoryBot.create(:user) }
  describe 'GET /admin/users' do
    context 'is an authenticated user' do
      it 'works to admin_users_path' do
        get admin_users_path
        expect(response).to have_http_status(200)
      end
    end
  end
end
