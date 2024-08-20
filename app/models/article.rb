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
  validates :content, presence: true

  def display_created_at
    # 日時の表示変更
    I18n.l(self.created_at, format: :default)
    # I18n.l(article.created_at, format: :default)
    # articleの部分はselfで受け取れる
  end
end
