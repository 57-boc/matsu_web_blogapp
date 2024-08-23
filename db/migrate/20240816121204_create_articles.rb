class CreateArticles < ActiveRecord::Migration[6.0]
  # migrationはデータベースを変更するための設計図
  def change
    create_table :articles do |t|
      t.references :user, null: false
      # articlesテーブルにuserとういカラムを追加(referencesで結びつける)
      # null: false このカラムには絶対に値が入っていないとダメ
      t.string :title, null: false
      # stringは短い文字列
      t.text :content, null: false
      # textは長い文字列
      t.timestamps
    end
  end
end
