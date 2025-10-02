class ApplicationController < ActionController::Base
  # ログインしていないユーザーはログイン画面に遷移する。
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    # sign_upの時，nameを取得するストロングパラメーター
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
