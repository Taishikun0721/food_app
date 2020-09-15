require 'rails_helper'

describe 'about foods function', type: :system do
  let(:user_a) { FactoryBot.create(:user) }

  context 'authenticated user' do
    it 'shows new_food_path through foods_path' do
      sign_in(user_a)
      click_link 'New Post'
      expect(page).to have_content 'What You Eat'
    end

    it 'create new post' do
      sign_in(user_a)
      click_link 'New Post'
      visit '/foods/new'
      fill_in 'foods_description', with: 'test' * 5
      image_example = File.join(Rails.root, 'spec/factories/images/after.png')
      attach_file 'food_image', image_example, make_visible: true
      select 'breakfast', from: 'Categories'
      find('.btn.btn-default.text-white.mt-5.btn-round').click
      expect(page).to have_content 'New Post'
    end

    it 'show edit page' do
      sign_in(user_a)
      click_link 'New Post'
      visit '/foods/new'
      expect(page).to have_content `Create What You Eat`
    end
  end
end