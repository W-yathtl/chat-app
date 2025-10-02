class UsersController < ApplicationController
  def edit
  end

  # ユーザー情報更新
  def update
    #現在のユーザー情報を（user_params)に更新
     if current_user.update(user_params)
      # ルートパスにリダイレクト
      redirect_to root_path
    else
      何かしらのエラーがあった場合，入力した値をインスタンス変数に入れたままユーザー編集画面に戻る
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    # ユーザー情報はnameとemailのみを取得するストロングパラメーター
    params.require(:user).permit(:name, :email)
  end
end
