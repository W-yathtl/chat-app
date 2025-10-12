class Message < ApplicationRecord
  # メッセージはroom_idとuser_idのアソシエーションを定義する
  belongs_to :room
  belongs_to :user

  # imageとのアソシエーションを定義
  has_one_attached :image

  # メッセージ内容がないと保存しないバリデーション
  validates :content, presence: true
end
