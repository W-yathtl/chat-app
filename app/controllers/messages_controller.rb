class MessagesController < ApplicationController
  def index
    @message = Message.new   # メッセージ内容を格納する
    @room = Room.find(params[:room_id])  #room_idに入っているparamsを格納する
    @messages = @room.messages.includes(:user)
  end

  # メッセージを作成し@messageに格納する
  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)  

    # メッセージを保存できた時とできなかった時で処理を分ける
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index, status: :unprocessable_entity
    end
  end

  private
  # contentのみを取得するストロングパラメーター ユーザーidをparamsに含む
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
