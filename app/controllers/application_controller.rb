class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :owner?



  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def owner?(some_object)
    current_user == some_object.user
  end
end
