class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 名前がないと保存しないバリデーション
  validates :name, presence: true

  # 多くのroom_usersと紐づくアソシエーションを定義
  has_many :room_users
  # 多くのroomsと紐づくアソシエーションをroom_usersを中間モデルに定義
  has_many :rooms, through: :room_users
end
