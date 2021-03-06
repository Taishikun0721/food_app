module LoginSupport
  def sign_in(user)
    visit login_path
    fill_in 'session_email', with: user.email
    fill_in 'session_password', with: user.password
    click_button 'Login'
    visit root_path
  end

end
RSpec.configure do |config|
  config.include LoginSupport
end