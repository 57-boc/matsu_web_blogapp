class RemoveContentFromArticles < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :content, :text
    # :textを入れないとrollbackが出来ないので注意する
  end
end
