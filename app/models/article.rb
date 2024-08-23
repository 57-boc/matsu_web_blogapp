# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
class Article < ApplicationRecord
  validates :title, presence: true
  # validates titleの入力チェック presence: true(入力必須)
  validates :title, length: {minimum: 2, maximum: 100}
  # validates titleの入力チェック 2文字以上の入力100文字以下
  validates :title, format: {with: /\A(?!\@)/}
  # validates titleの入力チェック 先頭は@から始まったらダメ
  validates :content, presence: true
  validates :content, length: {minimum: 10}
  validates :content, uniqueness: true
  # 内容がユニークかどうか調べる

  validate :validate_title_and_content_length
  # validate(sがついてない)は独自のルール

  belongs_to :user
  # Userモデルに紐づいている

  def display_created_at
    # 日時の表示変更
    I18n.l(self.created_at, format: :default)
    # I18n.l(article.created_at, format: :default)
    # articleの部分はselfで受け取れる
  end

  def author_name
    user.display_name
  end

  private
  def validate_title_and_content_length
    char_count = self.title.length + self.content.length
    errors.add(:content, '100文字以上じゃないとダメ！') unless char_count > 100
    # 100文字以上入力がされなかったときエラーを表示する
    # unless char_count > 100
      # errors.add(:content, '100文字以上じゃないとダメ！')
    # end  と同じ
  end

end
