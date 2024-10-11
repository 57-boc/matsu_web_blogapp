class ApplicationController < ActionController::Base
  def current_user
    ActiveDecorator::Decorator.instance.decorate(super) if super.present?
    super
    # superはもともとdeviseで定義されているcurrent_userのこと
    # ActiveDecoratorとdeviseの相性が悪いので
    # ActiveDecoratで使うときcurrent_userにあらためてする
  end
end
