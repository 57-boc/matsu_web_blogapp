class LikesController < ApplicationController
  # deviseが用意してくれているauthenticate_user!
  before_action :authenticate_user!
  # ログインしていないと機能を使えないようにする

  def create
    article = Article.find(params[:article_id])
    # いいねをつけたい記事を探してくる
    article.likes.create!(user_id: current_user.id)
    # 今のユーザのいいねをつける
    redirect_to article_path(article)
    # いいねをつけた記事に移動
  end

  def destroy
    article = Article.find(params[:article_id])
    like = article.likes.find_by!(user_id: current_user.id)
    # この記事のいいねから今のユーザーがいるか探す
    # find_by! destroyするときは絶対いいねされているはずなので!を付けれる
    like.destroy!
    redirect_to article_path(article)
  end
end