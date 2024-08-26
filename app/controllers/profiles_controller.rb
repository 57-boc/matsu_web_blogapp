class ProfilesController < ApplicationController
  # deviseが用意してくれているauthenticate_user!
  before_action :authenticate_user!
  # ログインしていないと機能を使えないようにする

  def show
    @profile = current_user.profile
    # user.rbでhas_one :profileとしているから
  end

  def edit
    @profile = current_user.build_profile
    # has_oneで定義してあるのでbuildしたいときbuild_profileと書く
  end

  def update
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to profile_path, notice: 'プロフィール更新完了'
    else
      flash.now[:error] = 'プロフィール更新に失敗しました'
      # flashのkeyにerrorを入れvalueに'保存に失敗しました'を入れる
      render :edit
      # new.html.erbを表示
    end
  end

  private
  def profile_params
    params.require(:profile).permit(
      :nickname,
      :introduction,
      :gender,
      :birthday,
      :subscribed
    )
  end

end