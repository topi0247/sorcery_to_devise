class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create; end

  def destroy; end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
