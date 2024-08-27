class LikesController < ApplicationController
  # deviseが用意してくれているauthenticate_user!
  before_action :authenticate_user!
  # ログインしていないと機能を使えないようにする

  def create
    article = Article.find(params[:article_id])
    article.likes.create!(user_id: current_user.id)
    redirect_to article_path(article), notice: 'いいねできたよ'
  end
end