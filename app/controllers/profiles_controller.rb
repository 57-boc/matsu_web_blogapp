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
end