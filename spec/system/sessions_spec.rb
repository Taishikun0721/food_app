require 'rails_helper'

describe 'about sessions function', type: :system do
  let(:user_a) { FactoryBot.create(:user) }

  describe '#login' do
    it 'successfully login' do
      sign_in(user_a)
      expect(page).to have_content 'New Post'
    end

    context 'is logged in' do
      it 'shows logout link' do
        sign_in(user_a)
        expect(page).to have_content 'LogOut'
      end
    end

    context 'is not logged in' do
      it 'shows login link' do
        visit foods_path
        expect(page).to have_content 'LogIn'
      end
    end
  end
end