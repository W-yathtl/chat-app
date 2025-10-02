class Room < ApplicationRecord
  # 多くのroom_usersと紐づくアソシエーションを定義
  has_many :room_users
  # 多くのusersと紐づくアソシエーションをroom_usersを中間モデルに定義
  has_many :users, through: :room_users

  # 名前がないと保存しないバリデーション
  validates :name, presence: true

  
end
