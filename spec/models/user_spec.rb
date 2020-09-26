require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user_a) { create(:user) }

  describe 'method test' do
    it 'is successfully created' do
      expect(user_a).to be_valid
    end
  end

  describe 'validation test' do
    it 'is invalid without email' do
      user_a.email = nil
      user_a.valid?
      if I18n.locale == :en
        expect(user_a.errors[:email]).to include "can't be blank"
      else
        expect(user_a.errors[:email]).to include 'を入力してください'
      end
    end

    it 'is invalid without nickname' do
      user_a.nickname = nil
      user_a.valid?
      if I18n.locale == :en
        expect(user_a.errors[:nickname]).to include "can't be blank"
      else
        expect(user_a.errors[:nickname]).to include 'を入力してください'
      end
    end

    it 'is invalid nickname is too long' do
      user_a.nickname = 'a' * 16
      user_a.valid?
      if I18n.locale == :en
        expect(user_a.errors[:nickname]).to include 'is too long (maximum is 15 characters)'
      else
        expect(user_a.errors[:nickname]).to include 'は15文字以内で入力してください'
      end
    end
  end
end

