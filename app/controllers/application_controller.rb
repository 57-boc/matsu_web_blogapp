class ApplicationController < ActionController::Base
  before_action :set_locale
  # 何かアクションが起きるたびにset_localeを行いたいから
  # 全てのapplicationに反映させたい

  def current_user
    ActiveDecorator::Decorator.instance.decorate(super) if super.present?
    super
    # superはもともとdeviseで定義されているcurrent_userのこと
    # ActiveDecoratorとdeviseの相性が悪いので
    # ActiveDecoratで使うときcurrent_userにあらためてする
  end

  # default_url_optionsはrailsの設定でbefore_actionに入れなくても最初に行われる
  def default_url_options
    { locale: I18n.locale }
  end

  private
  def set_locale
    # パラメータをとってくるか、パラメータがないときはdefaultに設定する
    I18n.locale = params[:locale] || I18n.default_locale
  end
end

# /articles/1 => params[:id] と
# /articles?id=1 => params[:id] 同じものがとれる
# ?id=1 この形式は好きなように増やせる
# daily-trial.com?impression=twitter このように仕込むとTwitterからきたことが分かる