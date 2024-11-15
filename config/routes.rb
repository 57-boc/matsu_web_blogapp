require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq' if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  # 開発環境でLetterOpenerWeを見ると内容が確認できる

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  # rootを articles#indexにしろということ


  resources :articles
  # articlesそれぞれにcomments作成用のURLを作る
  # ->namespaceへ移動

  resources :accounts, only: [:show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
  end


  # resources :articles
  # ↓全部使われているのでonlyを使う必要がない
  # resources :articles, only: [:show, :new, :create, :edit, :update, :destroy]
  # resourcesでURLを作成してくれる（articlesのshow, new, create, edit, destroyアクション関係のURLを作成してくれる）

  # get '/about' => 'home#about'
  # ↑home#about はhome_controller.rbのaboutを実行しろということ


  scope module: :apps do
    resources :favorites, only: [:index]
    resource :timeline, only: [:show]
    resource :profile, only: [:show, :edit, :update]
    # profileは単数なのでindexは生成されない
  end


  namespace :api, defaults: {format: :json} do
    # amespaceでcontroller（のフォルダ構成）を書き換える
    # defaults: {format: :json}でformatを常にjsonで返すことを指定

    scope '/articles/:article_id' do
      # scopeでurlを書き換える
      resources :comments, only: [:index, :create]
      # resources :comments, only: [:index, :new, :create]
      # 記事にコメントを付ける

      resource :like, only: [:show, :create, :destroy]
      # 記事にいいねを付ける
      # 特定の記事に対して付けられるいいねは1つなので単数形
      # レコードを作成するので:createを使う
    end
  end
end
