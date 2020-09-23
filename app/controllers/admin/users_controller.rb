class Admin::UsersController < ApplicationController
  before_action :set_user, only: :destroy
  before_action :admin_required

  def index
    @users = User.where(admin: false)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: '新しいユーザーを作成しました。'
    else
      render :new
    end
  end

  def destroy
    @user.destroy!
    redirect_to admin_users_path, notice: 'ユーザーを削除しました。'
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def admin_required
    redirect_to foods_path, notice: '権限がありません。' unless current_user.admin?
  end
end
