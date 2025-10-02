class RoomsController < ApplicationController
 def new
  # 新規ルームを作成し@roomに格納する
    @room = Room.new
  end
end
