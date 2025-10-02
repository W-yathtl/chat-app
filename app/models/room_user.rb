class RoomUser < ApplicationRecord
  # room_userはroom_idとuser_idの中間アソシエーションを定義する
  belongs_to :room
  belongs_to :user
end
