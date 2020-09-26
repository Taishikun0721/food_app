require 'rails_helper'

RSpec.describe 'SessionsApis', type: :request do
  let(:test_user) { create(:user) }
  let(:session_params) { attributes_for( :user) }
  let(:session_attribute) { attributes_for(:user) }
  describe 'GET /sessions/new' do
    it 'works to new_sessions_path' do
      get login_path
      expect(response).to have_http_status '200'
    end

    it 'works to Log_out' do
      delete logout_path
      expect(response).to redirect_to login_path
    end
  end
end
