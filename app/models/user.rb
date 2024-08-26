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

  def has_written?(article)
    articles.exists?(id: article.id)
    # current_user.articles.exists?でuserのarticleのなかに、このidの記事が存在するかチェック
  end

  # testsample@gmail.comがユーザのメールアドレスだった時
  def display_name
    self.email.split('@').first
    # =>split('@')で['testsample','gmail.com']と配列にする
  end

  def prepare_profile
    profile || build_profile
  end
end
