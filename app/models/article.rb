# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  content    :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Article < ApplicationRecord
  validates :title, presence: true
  # validates titleの入力チェック presence(入力されているか)
  validates :title, length: {minimum: 2, maximum: 100}
  # validates titleの入力チェック 2文字以上の入力100文字以下
  validates :title, format: {with: /\A(?!\@)/}
  # validates titleの入力チェック 先頭は@から始まったらダメ
  validates :content, presence: true
  validates :content, length: {minimum: 10}
  validates :content, uniqueness: true
  # 内容がユニークかどうか調べる

  def display_created_at
    # 日時の表示変更
    I18n.l(self.created_at, format: :default)
    # I18n.l(article.created_at, format: :default)
    # articleの部分はselfで受け取れる
  end
end
