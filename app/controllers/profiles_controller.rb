class ProfilesController < ApplicationController
  # deviseが用意してくれているauthenticate_user!
  before_action :authenticate_user!
  # ログインしていないと機能を使えないようにする

  def show
    @profile = current_user.profile
    # user.rbでhas_one :profileとしているから
  end

  def edit
  end
end