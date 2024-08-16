class CreateArticles < ActiveRecord::Migration[6.0]
  # migrationはデータベースを変更するための設計図
  def change
    create_table :articles do |t|
      t.string :title
      # stringは短い文字列
      t.text :content
      # textは長い文字列
      t.timestamps
    end
  end
end
