Rails.application.routes.draw do
  devise_for :users
  get 'messages/index'
  # ルートパスへのアクセスがあったらindexアクションを呼び出す
   root to: "rooms#index"

  # ユーザーコントローラーのルーティング
   resources :users, only: [:edit, :update]

   # ルームコントローラーのルーティング
   resources :rooms, only: [:new, :create]

  #  メッセージコントローラーのルーティング roomモデルのnewとcreateアクションとネスト構造にする。
  resources :rooms, only: [:new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end
end
