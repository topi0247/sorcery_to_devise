class UsersController < ApplicationController
  skip_before_action :require_login, only: %i(new create)

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create; end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to users_path, success: 'ユーザーを削除できました'
    else
      flash.now[:danger] = 'ユーザーの削除に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
