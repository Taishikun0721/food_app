class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'ログインが成功しました。'
    else
      render :new, alert: 'ログインできませんでした。もう一度入力やり直して下さい。'
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: 'ログアウトしました。'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
