Rails.application.routes.draw do
  get 'messages/index'
  # ルートパスへのアクセスがあったらindexアクションを呼び出す
   root to: "messages#index"
end
