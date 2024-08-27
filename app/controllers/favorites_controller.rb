class FavoritesController < ApplicationController
  # deviseが用意してくれているauthenticate_user!
  before_action :authenticate_user!
  # ログインしていないと機能を使えないようにする

  def index
    @articles =current_user.favorite_articles
  end
end