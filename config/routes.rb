Rails.application.routes.draw do
  devise_for :users
  get 'messages/index'
  # ルートパスへのアクセスがあったらindexアクションを呼び出す
   root to: "messages#index"
end
