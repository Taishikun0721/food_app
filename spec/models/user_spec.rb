require 'rails_helper'

RSpec.describe User, type: :model do
  let(:test_user) { FactoryBot.create(:user) }

  describe 'method test' do
    it 'is successfully created' do
      expect(test_user).to be_valid
    end

  end
end

