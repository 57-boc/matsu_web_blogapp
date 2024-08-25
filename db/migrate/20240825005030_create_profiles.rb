class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false
      # profileテーブルにuserとういカラムを追加(referencesで結びつける)
      t.string :nickname
      t.text :introduction
      t.integer :gender
      # genderは色々な呼び方（男性・男・menなど）があるのでselect形式にしたいからintegerにしている
      t.date :birthday
      t.boolean :subscribed, default: false
      # ture, falseで購読するかしないか
      t.timestamps
    end
  end
end
