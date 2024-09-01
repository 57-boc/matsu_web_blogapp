require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MatsuWebBlogApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # .envを読み込む
    Bundler.require(*Rails.groups)
    Dotenv::Railtie.load

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.i18n.default_locale = :ja
    # デフォルト言語を日本語にする
    # application.rbはサーバを立ち上げるときに読み込むので、変更したら再度サーバーを立ち上げる
  end
end
