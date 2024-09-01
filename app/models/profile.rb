# == Schema Information
#
# Table name: profiles
#
#  id           :integer          not null, primary key
#  birthday     :date
#  gender       :integer
#  introduction :text
#  nickname     :string
#  subscribed   :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer          not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
class Profile < ApplicationRecord
  enum gender: {male: 0, female: 1, other: 2}
  # enumでgenderの中身を定義する（入力値が0だったらmaleとする）
  belongs_to :user
  # Userモデルに紐づいている
  has_one_attached :avatar
  # アバター用の画像を設定できるようにする Profileにavatarという画像との紐づきを追加出来る

  def age
    return '不明' unless birthday.present?
    # 誕生日が入力されてない場合「不明」と返す
    years = Time.zone.now.year - birthday.year
    days = Time.zone.now.yday - birthday.yday
    # ydayは1月1日から何日たったか
    if days < 0
      "#{years - 1}歳"
    else
      "#{years}歳"
    end
  end
end
