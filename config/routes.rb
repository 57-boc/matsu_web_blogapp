Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  # rootを articles#indexにしろということ

  resources :articles
  # ↓全部使われているのでonlyを使う必要がない
  # resources :articles, only: [:show, :new, :create, :edit, :update, :destroy]
  # resourcesでURLを作成してくれる（articlesのshow, new, create, edit, destroyアクション関係のURLを作成してくれる）

  # get '/about' => 'home#about'
  # ↑home#about はhome_controller.rbのaboutを実行しろということ
end
