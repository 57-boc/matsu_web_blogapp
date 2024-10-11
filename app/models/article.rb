# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
class Article < ApplicationRecord
  has_one_attached :eyecatch
  # アイキャッチ用の画像を設定できるようにする Articleにeyecatchという画像との紐づきを追加出来る
  has_rich_text :content

  validates :title, presence: true
  # validates titleの入力チェック presence: true(入力必須)
  validates :title, length: {minimum: 2, maximum: 100}
  # validates titleの入力チェック 2文字以上の入力100文字以下
  validates :title, format: {with: /\A(?!\@)/}
  # validates titleの入力チェック 先頭は@から始まったらダメ
  validates :content, presence: true

  has_many :comments, dependent: :destroy
  # articleは複数のcommentを持っている dependent: :destroyはarticleが削除されたときcommentsも消える

  has_many :likes, dependent: :destroy
  # Articleがlikes(複数のLikeモデル)を持っている
  # dependent: :destroy Userが削除されたときにUserのlikesも削除する

  belongs_to :user
  # Userモデルに紐づいている

end
