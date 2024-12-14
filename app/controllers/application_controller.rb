class ApplicationController < ActionController::Base
  add_flash_types :success, :danger
  before_action :require_login

  def not_authenticated
    redirect_to login_path, danger: 'ログインしてください'
  end
end
