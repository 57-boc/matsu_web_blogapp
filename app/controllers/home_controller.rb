class HomeController < ApplicationController
  #ApplicationControllerを継承している
  def index
    # render 'home/index'
    # renderは表示するという意味 viewsの中homeの中のindex.html.erbを表示せよという意味
    # HomeControllerの中のindexはrender 'home/index'に設定されているので、書かなくてもよい
    @article = Article.first
    # Articleテーブルの一番最初をとってくる
  end

  def about
  end
end