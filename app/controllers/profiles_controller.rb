class ProfilesController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def show

  end

  def edit

  end

  def update
    if @user.update(profile_params)
      reset_session
      redirect_to login_path, notice: 'ユーザー情報を更新しました。ログインし直して下さい。'
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find_by(id: current_user.id)
  end
end
