class Apps::ProfilesController < Apps::ApplicationController

  def show
    @profile = current_user.profile
    # user.rbでhas_one :profileとしているから
  end

  def edit
    @profile = current_user.prepare_profile
    # user.rbで定義したメソッドprepare_profileを使う
    # @profile = current_user.profile || @profile = current_user.build_profile
    # ↓これをまとめると一行になる
    # if current_user.profile.present?
    #   # current_userのprofileが存在するのであれば
    #   @profile = current_user.profile
    # else
    #   # current_userのprofileが存在しない
    #   @profile = current_user.build_profile
    #   # has_oneで定義してあるのでbuildしたいときbuild_profileと書く
    # end
  end

  def update
    @profile = current_user.prepare_profile
    # ↑editと同じ動き
    @profile.assign_attributes(profile_params)
    # @profileにprofile_paramsの値を入れる
    # @profile = current_user.build_profile(profile_params)
    # 空の@profileに値を入れていく
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
      :subscribed,
      :avatar
    )
  end

end