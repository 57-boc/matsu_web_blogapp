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
    @article = Article.new
    # 記事を入れる入れ物を作成
  end

  def create
    @article = Article.new(article_params)
    # titleとcontentの情報が入った@articleを作成
    if @article.save
      # @articleを保存したら
      redirect_to article_path(@article)
      #保存した記事のページに飛ぶ
    else
      render :new
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
    # 投稿を受け取ったときtitleとcontentを抜き出してくる
  end
end