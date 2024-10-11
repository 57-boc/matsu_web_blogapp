# frozen_string_literal: true

module UserDecorator
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

  def avatar_image
    if profile&.avatar&.attached?
      # &.attached?で画像がアップロードされているか調べる
      profile.avatar
    else
      'default-avatar.png'
    end
  end
  
end
