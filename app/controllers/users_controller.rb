class UsersController < ApplicationController
  skip_before_action :require_login, only: %i(new create)

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to users_path, success: 'ユーザーを登録できました'
    else
      flash.now[:danger] = 'ユーザーの登録に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path, success: 'ユーザーを更新できました'
    else
      flash.now[:danger] = 'ユーザーの更新に失敗しました'
      render :edit, status: :unprocessable_entity
    end
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
