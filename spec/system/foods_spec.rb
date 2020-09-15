require 'rails_helper'

describe 'about foods function', type: :system do
  let(:user_a) { FactoryBot.create(:user) }
  let!(:category_breakfast) { FactoryBot.create(:category, name: 'breakfast') }
  let!(:category_lunch) { FactoryBot.create(:category, name: 'lunch') }
  let!(:category_dinner) { FactoryBot.create(:category, name: 'dinner') }

  context 'authenticated user' do
    it 'shows new_food_path through foods_path' do
      sign_in(user_a)
      click_link 'New Post'
      expect(page).to have_content 'What You Eat'
    end

    it 'create new post'  do
      sign_in(user_a)
      click_link 'New Post'
      fill_in 'foods_description', with: 'test' * 5
      image_example = File.join(Rails.root, 'spec/factories/images/after.png')
      attach_file 'food_image', image_example, make_visible: true
      select 'lunch', from: 'food_category_id'
      expect {
        find('.btn.btn-default.text-white.mt-5.btn-round').click
      }.to change(user_a.foods, :count).by(1)
    end

    it 'show edit page' do
      sign_in(user_a)
      click_link 'New Post'
      expect(page).to have_content `Create What You Eat`
    end
  end
end