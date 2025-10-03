class Message < ApplicationRecord
  # メッセージはroom_idとuser_idのアソシエーションを定義する
  belongs_to :room
  belongs_to :user

  # メッセージ内容がないと保存しないバリデーション
  validates :content, presence: true
end
