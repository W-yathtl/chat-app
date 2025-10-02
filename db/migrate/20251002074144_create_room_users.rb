class CreateRoomUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :room_users do |t|

      # room_idとuser_idの中間アソシエーションを定義する
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
