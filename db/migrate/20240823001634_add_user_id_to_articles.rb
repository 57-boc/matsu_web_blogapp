class AddUserIdToArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :user
    # articlesテーブルにuserとういカラムを追加(他のテーブルと紐づけるにはadd_referenceを使う)
    # add_colum :articles, :user_id, :integer
    # ↑articlesテーブルにuser_idというカラム(integer形式)を追加
  end
end
