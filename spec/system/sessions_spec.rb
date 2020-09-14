require 'rails_helper'

describe 'about sessions function', type: :system do
  let(:user_a) { FactoryBot.create(:user) }

  it 'successfully login' do
    sign_in(user_a)
    expect(page).to have_content 'New Post'
  end
end