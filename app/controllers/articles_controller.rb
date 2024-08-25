class ArticlesController < ApplicationController
  before_action :set_artivcle, only: [:show]
  # show, edit, updateのときだけ先にset_artivcleを実行する

  # deviseが用意してくれているauthenticate_user!
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # ログインしていないと:new, :create, :edit, :update, :destroyの機能を使えないようにする

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
    @comments = @article.comments
    # 表示している記事のcommentsをとってきて@commentsに入れる
  end

  def new
    @article = current_user.articles.build
    # user.rbでhas_many :articlesとしているから
    # current_userで現在ログインしているユーザーをとってくる 関連性がある場合はbuildを使う(動きはnewと同じ)
    # @article = Article.new
    # 記事を入れる入れ物を作成
  end

  def create
    @article = current_user.articles.build(article_params)
    # 保存に失敗したときrender :newで使うので@articleにしている
    # @article = Article.new(article_params)
    # article_paramsでtitleとcontentの情報が入った@articleを作成
    if @article.save
      # @articleを保存したら
      redirect_to article_path(@article), notice: '保存できたよ'
      #保存した記事のページに飛ぶ notice(flashにはerrorとnoticeの2種類がある)
      # notice: がkey '保存できたよ'がvalue
    else
      flash.now[:error] = '保存に失敗しました'
      # flashのkeyにerrorを入れvalueに'保存に失敗しました'を入れる
      render :new
      # new.html.erbを表示
    end
  end

  def edit
    @article = current_user.articles.find(params[:id])
    # カレントユーザーのarticleからパラメータidを持つ記事を探してくる
  end

  def update
    @article = current_user.articles.find(params[:id])
    if @article.update(article_params)
      # article_paramsでtitleとcontentの情報が入った@articleを保存出来た場合
      redirect_to article_path(@article), notice: '更新できたよ'
      # @articleのページに遷移してメッセージを表示
    else
      flash.now[:error] = '更新できませんでした'
      # flashのkeyにerrorを入れvalueに'保存に失敗しました'を入れる
      render :edit
      # edit.html.erbを表示
    end
  end

  def destroy
    article = current_user.articles.find(params[:id])
    # article = Article.find(params[:id])
    article.destroy!
    # articleを削除する !を付けることで削除されなかったとき例外処理が発生する
    redirect_to root_path, notice: '削除できたよ'
    # rootページに遷移してメッセージを表示
  end

  # Strong paramaterはprivateで作成する
  # class Articleを更新するので名前はarticle_paramsとする決まり
  private
  def article_params
    params.require(:article).permit(:title, :content)
    # article（必須）を受け取ったときtitleとcontentだけを保存する
  end

  def set_artivcle
    @article = Article.find(params[:id])
    # パラメータidを持つ記事を探してくる
  end
end
