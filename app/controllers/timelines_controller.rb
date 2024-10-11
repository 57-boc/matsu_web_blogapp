class TimelinesController < ApplicationController
  before_action :authenticate_user!

  def show
    user_ids = current_user.followings.pluck(:id)
    # pluck(:id)でid一覧を取得する [1, 3, 4]
    @articles = Article.where(user_id: user_ids)
  end
end