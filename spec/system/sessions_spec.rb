require 'rails_helper'

describe 'about sessions function', type: :system do
  let(:user_a) { FactoryBot.create(:user) }

  it 'successfully login' do
    sign_in(user_a)
    expect(page).to have_content 'Foods#index'
  end

  context 'during sign in' do
    # it 'existing current user' do
    #   sign_in(user_a)
    #   expect(user_a.persisted?).to eq true
    # end
  end



end