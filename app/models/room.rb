class Room < ApplicationRecord
  # 多くのroom_usersと紐づくアソシエーションを定義 dependentによって，roomが消えると紐づくroom_usersも消える
  has_many :room_users, dependent: :destroy
    # 多くのusersと紐づくアソシエーションをroom_usersを中間モデルに定義
  has_many :users, through: :room_users

  # メッセージのアソシエーションを定義
   has_many :messages, dependent: :destroy
  
  # 名前がないと保存しないバリデーション
  validates :name, presence: true

  
end
