# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, dependent: :destroy
  # Userがarticles(複数のArticleモデル)を持っている
  # dependent: :destroy Userが削除されたときにUserのarticlesも削除する

  has_one :profile, dependent: :destroy
  # Userが1つのprofileを持っている
  # dependent: :destroy Userが削除されたときにUserのprofileも削除する

  delegate :birthday, :age, :gender, to: :profile, allow_nil: true

  def has_written?(article)
    articles.exists?(id: article.id)
    # current_user.articles.exists?でuserのarticleのなかに、このidの記事が存在するかチェック
  end

  # testsample@gmail.comがユーザのメールアドレスだった時
  def display_name
    # 「&.」ぼっち演算子という
    profile&.nickname || self.email.split('@').first
    # ↓を一行にまとめると↑になる
    # if profile && profile.nickname
    #   # profileが保存されていて、かつnicknameも保存されているとき
    #   profile.nickname
    # else
    #   self.email.split('@').first
    #   # =>split('@')で['testsample','gmail.com']と配列にする
    # end
  end


  # delegate :birthday, :gender, to: :profile, allow_nil: true を↑で定義したので↓は必要なくなった
  # def birthday
  #   profile&.birthday
  # end

  # def gender
  #   profile&.gender
  # end

  def prepare_profile
    profile || build_profile
  end

  def avatar_image
    if profile&.avatar&.attached?
      # &.attached?で画像がアップロードされているか調べる
      profile.avatar
    else
      'default-avatar.png'
    end
  end
end
