class Message < ApplicationRecord
  # メッセージはroom_idとuser_idのアソシエーションを定義する
  belongs_to :room
  belongs_to :user

  # imageとのアソシエーションを定義
  has_one_attached :image

  # メッセージ内容か画像のどちらかがないと保存しないバリデーション
  validates :content, presence: true, unless: :was_attached?

#画像があればtrueなければfaslseを返す。
  def was_attached?
    self.image.attached?
  end
end
