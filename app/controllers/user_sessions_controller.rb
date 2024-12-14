class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i(new create)

  def new
    @user = User.new
  end

  def create
    email = user_params[:email]
    password = user_params[:password]
    if login(email, password)
      redirect_to users_path, success: 'ログインしました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to login_path, success: 'ログアウトしました'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
