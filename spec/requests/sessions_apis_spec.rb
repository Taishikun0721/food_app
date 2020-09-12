require 'rails_helper'

RSpec.describe 'SessionsApis', type: :request do
  let(:test_user) { FactoryBot.create(:user) }
  let(:session_params) { FactoryBot.attributes_for( :user) }

  describe 'GET /sessions/new' do
    it 'works to new_sessions_path' do
      get login_path
      expect(response).to have_http_status '200'
    end

    it 'works to Log_out' do
      delete logout_path
      expect(response).to redirect_to login_path
    end

    context 'when admin user' do
      it 'works to profile_path' do
        get profile_path
        expect(response).to have_http_status '200'
      end
    end


    context 'when not admin user' do

    end

  end
end
