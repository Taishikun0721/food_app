require 'rails_helper'

describe 'about users function', type: :system do
  let(:authenticated_user) { FactoryBot.create(:user, email: 'test1@example.com', admin: true) }
  let(:unauthenticated_user) { FactoryBot.create(:user) }
  let!(:category_breakfast) { FactoryBot.create(:category, name: 'breakfast') }
  let!(:category_lunch) { FactoryBot.create(:category, name: 'lunch') }
  let!(:category_dinner) { FactoryBot.create(:category, name: 'dinner') }

  describe '#link' do
    context 'as admin' do
      it 'not find profile and find all users profile' do
        sign_in(authenticated_user)
        expect(page).to have_content 'All User'
        expect(page).to_not have_content 'Profile'
      end
    end

    context 'as not admin' do
      it 'find profile and not find all users profile' do
        sign_in(unauthenticated_user)
        expect(page).to_not have_content 'All User'
        expect(page).to have_content 'Profile'
      end
    end
  end

  describe '#create' do
    context 'as admin' do
      it 'successfully create new user' do
        sign_in(authenticated_user)
        click_link 'All User'
        click_link 'New User'
        fill_in 'user_nickname', with: 'sample'
        fill_in 'user_email', with: 'sample@example.com'
        fill_in 'user_password', with: 'password'
        fill_in 'user_password_confirmation', with: 'password'
        find('.btn.btn-default.text-white.mt-5.btn-round').click
        expect(page).to have_content 'sample'
        expect(page).to_not have_content 'あり'
        expect(page).to have_content '新しいユーザーを作成しました。'
      end

      it 'when missed create user rendering admin_user_new' do
        sign_in(authenticated_user)
        click_link 'All User'
        click_link 'New User'
        fill_in 'user_nickname', with: 'sample'
        fill_in 'user_email', with: 'sample@example.com'
        fill_in 'user_password', with: 'pa'
        fill_in 'user_password_confirmation', with: 'password'
        find('.btn.btn-default.text-white.mt-5.btn-round').click
        expect(page).to have_content 'Create New User'
        if I18n.locale == :en
          expect(page).to have_content "Password confirmation doesn't match Password"
        else
          expect(page).to have_content 'Password confirmationとPasswordの入力が一致しません'
        end
      end
    end

    context 'as not admin' do
      xit 'cant create user (on the way)' do
      end
    end
  end


  describe '#destroy' do
    context 'as admin' do
      xit 'successfully delete user (on the way)' do
        sign_in(unauthenticated_user)
        create_food(unauthenticated_user, :test1)
        create_food(unauthenticated_user, :test2)
        create_food(unauthenticated_user, :test3)
        expect(unauthenticated_user.foods.count).to eq 3
        click_link 'LogOut'
        sign_in(authenticated_user)
        expect(page).to have_content 'All User'
        click_link 'All User'
        click_link '削除'
        expect(unauthenticated_user.foods.count).to eq 0
      end
    end

    context 'as not admin' do

    end
  end

  describe '#update' do
    context 'as admin' do

    end

    context 'as not admin' do
      it 'successfully update own profile' do
        sign_in(unauthenticated_user)
        click_link 'Profile'
        click_link 'Edit'
        fill_in 'user_nickname', with: 'sampleuser'
        fill_in 'user_email', with: 'sample@example.com'
        fill_in 'user_password', with: 'password'
        fill_in 'user_password_confirmation', with: 'password'
        find('.btn.btn-default.text-white.mt-5.btn-round').click
        expect(page).to have_content 'ユーザー情報を更新しました。ログインし直して下さい。'
      end
    end
  end
end
