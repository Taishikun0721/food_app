require 'rails_helper'

describe 'about foods function', type: :system do
  let(:user_a) { FactoryBot.create(:user) }
  let(:user_b) { FactoryBot.create(:user, email: 'test1@example.com') }
  let!(:category_breakfast) { FactoryBot.create(:category, name: 'breakfast') }
  let!(:category_lunch) { FactoryBot.create(:category, name: 'lunch') }
  let!(:category_dinner) { FactoryBot.create(:category, name: 'dinner') }

  describe '#Link' do
    context 'authenticated user' do
      it 'shows new_food_path through foods_path' do
        sign_in(user_a)
        expect(page).to have_content 'New Post'
        click_link 'New Post'
        expect(page).to have_content 'What You Eat'
      end
      context 'as a post owner' do
        it 'show edit and delete button' do
          sign_in(user_a)
          create_food(user_a, 'this is a test')
          click_link 'Detail'
          expect(page).to have_content 'Edit'
          expect(page).to have_content 'Delete'
        end
      end

      context 'as not a post owner' do
        it 'show edit and delete button' do
          sign_in(user_a)
          create_food(user_a, 'this is a test')
          sign_in(user_b)
          click_link 'Detail'
          expect(page).to_not have_content 'Edit'
          expect(page).to_not have_content 'Delete'
        end
      end
    end
  end

  describe '#create' do
    context 'as authenticated user' do
      it 'create new post' do
        sign_in(user_a)
        create_food(user_a, 'first_test')
        expect(page).to have_content 'first_test'
      end
    end
  end

  describe '#update' do
    context 'as owner' do
      it 'update own post' do
        sign_in(user_a)
        create_food(user_a, 'before update')
        expect(page).to have_content 'before update'
        click_link 'Detail'
        click_link 'Edit'
        fill_in 'foods_description', with: 'testtest'
        select 'lunch', from: 'food_category_id'
        find('.btn.btn-default.text-white.mt-5.btn-round').click
        expect(page).to have_content 'testtest'
        expect(page).to_not have_content 'before update'
      end
    end

    context 'fuck validation' do
      it 'without description' do
        sign_in(user_a)
        create_food(user_a, 'before update')
        expect(page).to have_content 'before update'
        click_link 'Detail'
        click_link 'Edit'
        fill_in 'foods_description', with: ''
        select 'lunch', from: 'food_category_id'
        find('.btn.btn-default.text-white.mt-5.btn-round').click
        if I18n.locale == :en
          expect(page).to have_content "Description can't be blank"
        else
          expect(page).to have_content 'Descriptionを入力してください'
        end
      end
    end
  end

end
