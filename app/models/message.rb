class Message < ApplicationRecord
  # メッセージはroom_idとuser_idのアソシエーションを定義する
  belongs_to :room
  belongs_to :user
end
