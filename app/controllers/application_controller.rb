class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :owner?
  before_action :login_required

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def owner?(some_object)
    current_user.id == some_object.user_id if current_user
  end

  def login_required
    redirect_to login_path, notice: 'ログインが必要です。' unless current_user
  end
end
