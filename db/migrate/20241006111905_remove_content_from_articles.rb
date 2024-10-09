class RemoveContentFromArticles < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :content, :text
    # rollbackが出来ないので推奨しない
  end
end
