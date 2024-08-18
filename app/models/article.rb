class Article < ApplicationRecord
  validates :title, presence: true
  # validates titleの入力チェック presence(入力されているか)
  validates :content, presence: true
end
