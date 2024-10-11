module ArticleDecorator
  def display_created_at
    # 日時の表示変更
    I18n.l(self.created_at, format: :default)
    # I18n.l(article.created_at, format: :default)
    # articleの部分はselfで受け取れる
  end

  def author_name
    user.display_name
  end

  def like_count
    likes.count
    # countはActiveRecordの機能 数を数えてくれる(ないときは0が返ってくる)
  end
end