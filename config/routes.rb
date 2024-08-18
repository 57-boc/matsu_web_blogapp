Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  # rootを articles#indexにしろということ

  resources :articles, only: [:show, :new, :create]
  # resourcesでURLを作成してくれる（articlesのshow, new, createアクション関係のURLだけ作成してくれる）

  # get '/about' => 'home#about'
  # ↑home#about はhome_controller.rbのaboutを実行しろということ
end
