class ArticlesController < ApplicationController
  #ApplicationControllerを継承している
  def index
    # render 'home/index'
    # renderは表示するという意味 viewsの中homeの中のindex.html.erbを表示せよという意味
    # HomeControllerの中のindexはrender 'home/index'に設定されているので、書かなくてもよい
    # @article = Article.first
    # Articleテーブルの一番最初をとってくる
    @articles = Article.all
    # Articleテーブルの全てのデータをとってくる(一覧の取得はindexメソッドを使うのがルール)

  end

  def show
    @article = Article.find(params[:id])
    # params[:id]でURLで指定されたidが取得できる
  end

  def new
  end
end