class RoomsController < ApplicationController

  def index
  end
  def new
  # 新規ルームを作成し@roomに格納する
    @room = Room.new
 end

  def create
    # 新規ルームを作成し@roomに格納，ルートパスにリダイレクト
  @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      # 何かしらのエラーがあった場合，入力した値をインスタンス変数に入れたまま新規ルーム作成画面に戻る
      render :new, status: :unprocessable_entity
    end
  end

  # ルームを削除してルートパスにリダイレクト
  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end

  private
  # nameとuser_idsのみを取得するストロングパラメーター
  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end
